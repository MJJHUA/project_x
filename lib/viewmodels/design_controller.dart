import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:projectx/base/http.dart';
import 'package:projectx/models/design.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projectx/base/common.dart';

class DesignViewModel {
  Future getDesignList(int customerId) async {
    List<Design> designList = List<Design>();
    Map<String, dynamic> params = {"customer_id": customerId};
    Response resp = await HttpClient.post("/app/design/index", params);
    var content = jsonDecode(resp.toString());
    if (content['data']["list"] == null ||
        content['data']["list"].length == 0) {
      DesignListStateSubject.instance.update(null);
    } else {
      content['data']["list"].forEach((v) {
        designList.add(new Design.fromJson(v));
      });
      DesignListStateSubject.instance.update(designList);
    }
    return content;
  }

  void getDesignInfo(int index)  {
    DesignStateSubject.instance.update(DesignListStateSubject.instance.designList[index]);
  }

  Future addDesignInfo(
      Design design, int customerId, List<PickedFile> uploadImages) async {
    Map<String, dynamic> params = design.toJson();
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
    Response resp = await HttpClient.post("/app/design/save", params);
    var content = jsonDecode(resp.toString());
    if (content["data"]["list"] != null && content["data"]["list"].length > 0) {
      List<Design> designList = List<Design>();
      content['data']["list"].forEach((v) {
        designList.add(new Design.fromJson(v));
      });
      DesignListStateSubject.instance.update(designList);
    }
    return content;
  }
  
  Future updateDesignInfo(Design design, List<PickedFile> uploadImages,
      List<int> delImageIds) async {
    Map<String, dynamic> params = design.toJson();
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
    Response resp = await HttpClient.post("/app/designd_house/update", params);
    var content = jsonDecode(resp.toString());
    if (content["data"] != null) {
//      content["data"]["list"].forEach
      Design info = Design.fromJson(content["data"]);
//      DesignListStateSubject.instance.update(info);
    }
    return content;
  }

  

  Future delDesignInfo(int designId) async {
    Map<String, dynamic> params = {"id" : designId};
    Response resp = await HttpClient.post("/app/designd_house/delete", params);
    var content = jsonDecode(resp.toString());
    if (content["code"] == 200) {
//      DesignStateSubject.instance.update(null);
    }
    return content;
  }
}

class DesignListStateSubject {
  static DesignListStateSubject _instance;
  static DesignListStateSubject get instance => _getInstance();
  factory DesignListStateSubject() => _getInstance();
  static StreamController<List<Design>> _streamController;
  Stream<List<Design>> get designListStream => _streamController.stream;
  List<Design> _designList;
  List<Design> get designList => _designList;

  DesignListStateSubject._internal() {
    _streamController = StreamController.broadcast();
    _streamController.stream.listen((event) {
      _designList = event;
    });
  }

  static DesignListStateSubject _getInstance() {
    if (_instance == null) _instance = DesignListStateSubject._internal();
    return _instance;
  }

  void update(List<Design> model) {
    _streamController.sink.add(model);
  }

  static dispose() {
    if (_instance != null) {
      _streamController.close();
      _instance = null;
    }
  }
}

class DesignStateSubject {
  static DesignStateSubject _instance;
  static DesignStateSubject get instance => _getInstance();
  factory DesignStateSubject() => _getInstance();
  static StreamController<Design> _streamController;
  Stream<Design> get designStream => _streamController.stream;
  Design _design;
  Design get design => _design;

  DesignStateSubject._internal() {
    _streamController = StreamController.broadcast();
    _streamController.stream.listen((event) {
      _design = event;
    });
  }

  static DesignStateSubject _getInstance() {
    if (_instance == null) _instance = DesignStateSubject._internal();
    return _instance;
  }

  void update(Design model) {
    _streamController.sink.add(model);
  }

  static dispose() {
    if (_instance != null) {
      _streamController.close();
      _instance = null;
    }
  }
}
