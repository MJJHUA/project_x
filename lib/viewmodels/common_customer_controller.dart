import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:projectx/base/http.dart';
import 'package:projectx/models/common_customer.dart';

class CommonCustomerViewModel {
  Future<List<CommonCustomer>> getCommonCustomerList() async {
    List<CommonCustomer> list = List<CommonCustomer>();
    Response resp = await HttpClient.postNoParams("/app/common_customer/list");
    var content = jsonDecode(resp.toString());
    if (content["data"]["list"] != null) {
      content["data"]["list"].forEach((v) {
        list.add(new CommonCustomer.fromJson(v));
      });
    }
    return list;
  }

  Future<CommonCustomer> getCommonCustomerInfo(
    int customerId,
  ) async {
    Map<String, dynamic> params = {"customer_id": customerId};
    Response resp = await HttpClient.post("/app/common_customer/info", params);
    var content = jsonDecode(resp.toString());
    CommonCustomer commonCustomer = CommonCustomer.fromJson(content["data"]["customer_info"]);
    return commonCustomer;
  }
}
