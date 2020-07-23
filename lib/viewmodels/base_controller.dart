
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:projectx/base/http.dart';
import 'package:projectx/models/attributes.dart';

class BaseViewModel {

  Future<AttributeSettings> getInitSettings() async {
    AttributeSettings settings;
    Response resp = await HttpClient.postNoParams("/app/attributes");
    var content = jsonDecode(resp.toString());
    if (content["data"] != null) {
      settings = AttributeSettings.fromJson(content["data"]);
    }
    return settings;
  }

}