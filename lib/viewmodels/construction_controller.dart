import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:projectx/base/http.dart';
import 'package:projectx/models/construction.dart';

class ConstructionViewModel {

  Construction _construction;

  Construction get construction => _construction;

  Future getConstructionInfo(int customerId) async {
    Map<String, dynamic> params = {"customer_id": customerId};
    Response resp = await HttpClient.post("/app/construction/info", params);
    var content = jsonDecode(resp.toString());
//    _construction =  Construction.fromJson(content["data"]);

    if (content["data"] == null ||
        content["data"]["id"] == null)
      ConstructionStateSubject.instance.update(null);
    else {
      Construction info = Construction.fromJson(content["data"]);
      ConstructionStateSubject.instance.update(info);
    }

    return content;
  }
}

class ConstructionStateSubject {
  static ConstructionStateSubject _instance;
  static ConstructionStateSubject get instance => _getInstance();
  factory ConstructionStateSubject() => _getInstance();
  static StreamController<Construction> _streamController;
  Stream<Construction> get constructionStream => _streamController.stream;
  Construction _construction;
  Construction get construction => _construction;

  ConstructionStateSubject._internal() {
    _streamController = StreamController.broadcast();
    _streamController.stream.listen((event) {
      _construction = event;
    });
  }

  static ConstructionStateSubject _getInstance() {
    if (_instance == null) _instance = ConstructionStateSubject._internal();
    return _instance;
  }

  void update(Construction model) {
    _streamController.sink.add(model);
  }

  static dispose() {
    if (_instance != null) {
      _streamController.close();
      _instance = null;
    }
  }
}