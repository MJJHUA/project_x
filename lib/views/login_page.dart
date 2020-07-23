import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projectx/models/user.dart';
import 'package:projectx/viewmodels/login_controller.dart';
import 'package:projectx/base/routes.dart';
import 'package:projectx/base/application.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginContentPage();
  }
}

class _LoginContentPage extends State<LoginPage> {
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  final FocusNode _mobileFocus = FocusNode();
  final FocusNode _codeFocus = FocusNode();
  final LoginViewModel _loginController = LoginViewModel();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 200,
            ),
            textFieldMobile(),
            Padding(padding: EdgeInsets.only(top: 30)),
            textFieldCode(),
            Padding(padding: EdgeInsets.only(top: 30)),
            buttonLogin(),
          ],
        ),
      ),
    );
  }

  Widget textFieldMobile() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Colors.grey[300],
            ),
          ),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: _mobileController,
                keyboardType: TextInputType.number,
                focusNode: _mobileFocus,
                decoration: InputDecoration(
                    icon: Icon(Icons.phone_iphone),
                    border: InputBorder.none,
                    hintText: "请输入手机号",
                    hintStyle: TextStyle(
                      color: Colors.grey[500],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textFieldCode() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Colors.grey[300],
            ),
          ),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: _codeController,
                keyboardType: TextInputType.number,
                focusNode: _codeFocus,
                decoration: InputDecoration(
                    icon: Icon(Icons.lock),
                    border: InputBorder.none,
                    hintText: "请输入验证码",
                    hintStyle: TextStyle(
                      color: Colors.grey[500],
                    )),
              ),
            ),
            RaisedButton(
              color: Colors.teal,
              onPressed: () => _getCode(),
              child: Text(
                "获取验证码",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buttonLogin() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.circular(5),
        ),
        child: FlatButton(
          onPressed: () => _login(),
          child: Text(
            "登录",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }

  _login() async {
    _mobileFocus.unfocus();
    _codeFocus.unfocus();
    String mobile = _mobileController.text;
    String code = _codeController.text;
    if (mobile.isEmpty || code.isEmpty) {
      Fluttertoast.showToast(msg: "输入错误");
    } else {
      await _loginController.login(mobile, code, onSuccess: _onSuccess);
    }
  }

  // 登录成功
  _onSuccess(User user) {
    Application.router.navigateTo(context, Routes.menu);
  }

  // 登录失败
  _onError(String error) {
    Fluttertoast.showToast(msg: error);
  }

  _getCode() {
    _mobileFocus.unfocus();
    _codeFocus.unfocus();
//    return null;
    print("getcode");
  }
}
