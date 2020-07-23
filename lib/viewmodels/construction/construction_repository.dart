
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:projectx/base/http.dart';

class ConstructionRepository {
  Future getConstructionInfo(int customerId) async {
    Map<String, dynamic> params = {"customer_id": customerId};
    Response resp = await HttpClient.post("/app/construction/info", params);
    var content = jsonDecode(resp.toString());
    return content;
  }
}