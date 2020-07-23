import 'package:fluro/fluro.dart';
import 'package:projectx/models/attributes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'routes.dart';
import 'package:projectx/viewmodels/base_controller.dart';

class Application {
  static Router router;
  static String baseUrl =
      "https://216aff5a-3470-4d38-b24f-60e746cd06b7.mock.pstmn.io";
  static const String platform = "app";
  static const int loginType = 2;
  static String useToken;
  static String initRoute = Routes.menu;
  static int userId;
  static AttributeSettings settings;

  static initApp() async {
    // 加载本地数据 user_token and api_domain
    SharedPreferences _prefs = await SharedPreferences.getInstance();
//    _prefs.clear();
//    return;
    String _userToken = _prefs.getString("user_token");
    String _apiDomain = _prefs.getString("api_domain");
    int _userId = _prefs.getInt("user_id");

    if (_userToken == null || _apiDomain == null || _userId == null) {
      Application.initRoute = Routes.login;
      _prefs.clear();
      return;
    }

    if (_userToken.isEmpty || _apiDomain.isEmpty) {
      Application.initRoute = Routes.login;
      _prefs.clear();
      return;
    }

    Application.useToken = _userToken;
    Application.baseUrl = _apiDomain;
    Application.userId = _userId;

    // app 业务配置项 初始化数据

    settings = await BaseViewModel().getInitSettings();

  }

}
