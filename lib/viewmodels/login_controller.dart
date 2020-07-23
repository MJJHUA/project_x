import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:projectx/base/application.dart';
import 'package:projectx/base/http.dart';
import 'package:projectx/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel {
  Future<void> login(
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

    Response resp = await HttpClient.post("/base/user/login", params);

    if (resp.statusCode != 200) {
      onError("请求错误");
      return;
    }

    var content = jsonDecode(resp.toString());
    User user = User.fromJson(content["data"]);

    if (user.userToken == null || user.userToken.isEmpty) {
      onError("数据返回错误");
      return;
    }
    if (user.apiDomain == null || user.apiDomain.isEmpty) {
      onError("数据返回错误");
      return;
    }
    if (user.userId == null) {
      onError("数据返回错误");
      return;
    }

    Application.useToken = user.userToken;
    Application.baseUrl = user.apiDomain;
    Application.userId = user.userId;

    // 设置目标接口请求地址
    HttpClient.setBaseUrl(Application.baseUrl);

    //把token and api_domain存入shared_preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user_token", Application.useToken);
    prefs.setString("api_domain", Application.baseUrl);
    prefs.setInt("user_id", Application.userId);

    onSuccess(user);

  }
}
