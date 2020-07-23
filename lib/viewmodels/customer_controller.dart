import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:projectx/base/application.dart';
import 'package:projectx/base/http.dart';
import 'package:projectx/models/user.dart';
import 'package:projectx/models/customer.dart';

class CustomerViewModel {
  Future<void> getCustomerList2(
    String mobile,
    String code, {
    Function(User user) onSuccess,
    Function(String error) onError,
  }) async {
    Map<String, dynamic> params = {
      "username": mobile,
      "plateform": Application.platform,
      "login_type": Application.loginType,
      "code": code
    };

    Response resp = await HttpClient.post("/app/customer/list", params);

    if (resp.statusCode != 200) {
      onError("请求错误");
      return;
    }
  }

  Future<List<CustomerInfo>> getCustomerList() async {
    List<CustomerInfo> list = List<CustomerInfo>();
    Response resp = await HttpClient.postNoParams("/app/customer/list");
    var content = jsonDecode(resp.toString());
    if (content["data"]["list"] != null) {
      content["data"]["list"].forEach((v) {
        list.add(new CustomerInfo.fromJson(v));
      });
    }
    return list;
  }

  Future<Customer> getCustomerInfo(
    int customerId,
  ) async {
    Map<String, dynamic> params = {"customer_id": customerId};
    Response resp = await HttpClient.post("/app/customer/info", params);
    var content = jsonDecode(resp.toString());
    Customer customer = Customer.fromJson(content["data"]);
    return customer;
  }
}
