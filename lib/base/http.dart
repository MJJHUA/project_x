import 'dart:async';
import 'package:dio/dio.dart';
import 'package:projectx/base/application.dart';

class HttpClient {
  factory HttpClient() => _getInstance();
  static HttpClient _instance;
  static Dio _dio;

  HttpClient._private() {
    BaseOptions _options = BaseOptions(
      baseUrl: Application.baseUrl,
      responseType: ResponseType.json,
      connectTimeout: 500000,
      receiveTimeout: 300000,
    );
    _dio = Dio(_options);

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options) async {
        print("把token放在header里");
//        _dio.lock();
//                Future<dynamic> future = Future(()async{
//                  SharedPreferences prefs =await SharedPreferences.getInstance();
//                  return prefs.getString("loginToken");
//                });
//                return future.then((value) {
//                  options.headers["Authorization"] = value;
//                  return options;
//                }).whenComplete(() => dio.unlock()); // unlock the dio
      },
      onResponse: (Response resp) {
        print("onResponse预处理");
//        var content = jsonDecode(resp.toString());
//        return content["data"];
        return resp;
      },
      onError: (DioError e) async {
        print("onError预处理" + e.toString());
        return e;
      },
    ));
  }

  static HttpClient _getInstance() {
    print("instance");
    if (_instance == null) _instance = new HttpClient._private();
    return _instance;
  }

  static setBaseUrl(String url) {
    _getInstance();
    _dio.options.baseUrl = url;
  }

  static Future<Response> post(String url, Map<String, dynamic> params) async {
    _getInstance();
    Response response;
    response = await _dio.post(url, data: params);
    return response;
  }

  static Future<Response> postNoParams(String url,
      {Map<String, dynamic> params}) async {
    _getInstance();
    Response response;
    response = await _dio.post(url, data: params);
    return response;
  }
}
