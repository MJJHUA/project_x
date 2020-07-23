import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projectx/base/http.dart';
import 'package:projectx/models/measure.dart';
import 'package:projectx/base/common.dart';

class MeasureViewModel with ChangeNotifier {
  Future getMeasureInfo(int customerId) async {
    Map<String, dynamic> params = {"customer_id": customerId};
    Response resp = await HttpClient.post("/app/measured_house/index", params);
    var content = jsonDecode(resp.toString());
    if (content["data"]["info"] == null ||
        content["data"]["info"]["id"] == null)
      MeasureStateSubject.instance.update(null);
    else {
      Measure info = Measure.fromJson(content["data"]["info"]);
      MeasureStateSubject.instance.update(info);
    }
    return content;
  }

  Future updateMeasureInfo(Measure measure, List<PickedFile> uploadImages,
      List<int> delImageIds) async {
    Map<String, dynamic> params = measure.toJson();
    params.remove("images");
    if (uploadImages.length > 0) {
      List<String> _images = List<String>();
      uploadImages.forEach((element) async {
        String base64Image = await Common.imageToBase64AndCompress(element);
        _images.add(base64Image);
      });
      if (_images.length > 0) params["upload_images"] = uploadImages;
    }
    if (delImageIds.length > 0) params["del_images"] = delImageIds;
    Response resp = await HttpClient.post("/app/measured_house/update", params);
    var content = jsonDecode(resp.toString());
    if (content["data"]["id"] != null) {
      Measure info = Measure.fromJson(content["data"]);
      MeasureStateSubject.instance.update(info);
    }
    return content;
  }

  Future addMeasureInfo(
      Measure measure, int customerId, List<PickedFile> uploadImages) async {
    Map<String, dynamic> params = measure.toJson();
    params.remove("id");
    params.remove("images");
    params["customer_id"] = customerId;
    if (uploadImages.length > 0) {
      List<String> _images = List<String>();
      uploadImages.forEach((element) async {
        String base64Image = await Common.imageToBase64AndCompress(element);
        _images.add(base64Image);
      });
      if (_images.length > 0) params["upload_images"] = uploadImages;
    }
    Response resp = await HttpClient.post("/app/measured_house/save", params);
    var content = jsonDecode(resp.toString());
    if (content["data"]["id"] != null) {
      Measure info = Measure.fromJson(content["data"]);
      MeasureStateSubject.instance.update(info);
    }
    return content;
  }

  Future delMeasureInfo(int measureId) async {
    Map<String, dynamic> params = {"id" : measureId};
    Response resp = await HttpClient.post("/app/measured_house/delete", params);
    var content = jsonDecode(resp.toString());
    if (content["code"] == 200) {
      MeasureStateSubject.instance.update(null);
    }
    return content;
  }

}

class MeasureStateSubject {
  static MeasureStateSubject _instance;
  static MeasureStateSubject get instance => _getInstance();
  factory MeasureStateSubject() => _getInstance();
  static StreamController<Measure> _streamController;
  Stream<Measure> get measureStream => _streamController.stream;
  Measure _measure;
  Measure get measure => _measure;

  MeasureStateSubject._internal() {
    _streamController = StreamController.broadcast();
    _streamController.stream.listen((event) {
      _measure = event;
    });
  }

  static MeasureStateSubject _getInstance() {
    if (_instance == null) _instance = MeasureStateSubject._internal();
    return _instance;
  }

  void update(Measure model) {
    _streamController.sink.add(model);
  }

  static dispose() {
    if (_instance != null) {
      _streamController.close();
      _instance = null;
    }
  }
}
