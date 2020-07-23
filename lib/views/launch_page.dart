import 'package:flutter/material.dart';
import 'package:projectx/base/application.dart';
import 'package:projectx/base/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectx/views/customer_info_page.dart';

class LaunchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LaunchContentPage();
  }
}

class _LaunchContentPage extends State<LaunchPage> {

  @override
  Widget build(BuildContext context) {
    // 屏幕适配
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);

    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 200)),
          Center(
            child: Text("Launch Page"),
          ),
          Padding(padding: EdgeInsets.only(top: 30)),
          RaisedButton(
              child: Text("navigate to page"),
              onPressed: () {
                Application.router.navigateTo(context, Routes.customerInfo,);
              }),
        ],
      ),
    );
  }
}
