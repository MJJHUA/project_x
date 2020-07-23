import 'package:flutter/material.dart';
import 'package:projectx/base/application.dart';
import 'package:projectx/base/my_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectx/base/routes.dart';

class MenuPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MenuContentPage();
  }
}

class _MenuContentPage extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("应用"),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.message), title: Text("消息")),
          BottomNavigationBarItem(icon: Icon(Icons.apps), title: Text("应用")),
          BottomNavigationBarItem(
              icon: Icon(Icons.contacts), title: Text("通讯录")),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text("我的")),
        ],
      ),
      body:



        Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 105,
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 37.5)),
                  _menuNumberButton("待办任务", () {}, "12"),
                  Padding(padding: EdgeInsets.only(left: 45)),
                  _menuNumberButton("待我审批", () {}, "0"),
//                _menuIconButton("我的客户"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            Container(
              height: 395,
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      left: 18,
                      top: 15,
                    ),
                    child: Text(
                      "客户",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(
                        left: 37.5,
                      )),
                      _menuButton("我的客户", () {
                        Application.router
                            .navigateTo(context, Routes.customerList);
                      },Color(0xFF33CC99),Icon(MyIcons.yingyongkehuwodekehu,color: Colors.white,)),

                      Padding(padding: EdgeInsets.only(left: 45)),
                      _menuButton("公海客户", () {
                        Application.router
                            .navigateTo(context, Routes.commonCustomerList);
                      },Color(0xFF00CCDD),Icon(MyIcons.yingyongkehugonghaikehu,color: Colors.white,)),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 18,
                      top: 15,
                    ),
                    child: Text(
                      "工程",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: 37.5)),
                      _menuButton("施工管理", () {},Color(0xFF66AADD),Icon(MyIcons.yingyonggongchengshigongguanli,color: Colors.white,)),
                      Padding(padding: EdgeInsets.only(left: 45)),
                      _menuButton("工程派工", () {},Color(0xFF66CCBB),Icon(MyIcons.yingyonggongchenggongchengpaigong,color: Colors.white,)),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 18,
                      top: 15,
                    ),
                    child: Text(
                      "办公",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: 37.5)),
                      _menuButton("工作任务", () {
                        Application.router
                            .navigateTo(context, Routes.measureUpdate);
                      },Color(0xFF00CCCC),Icon(MyIcons.yingyongbangonggongzuorenwu,color: Colors.white,)),
                      Padding(padding: EdgeInsets.only(left: 45)),
                      _menuButton("工作审批", () {
                        Application.router
                            .navigateTo(context, Routes.constructionInfo);
                      },Color(0xFFEE9999),Icon(MyIcons.yingyongbangonggongzuoshenpi,color: Colors.white,)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }

  Widget _menuNumberButton(String name, Function func, String number) {
    Color bkColor = Colors.grey[200];

    Widget child = Text(
      number,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );

    return _menuButton(name, func, bkColor, child);
  }

  Widget _menuIconButton(String name, Function func,
      {String bkColor, String iconPath}) {
    Color bkColor = Colors.teal[200];
    Icon child = Icon(MyIcons.weibo);
    return _menuButton(name, func, bkColor, child);
  }

  Widget _menuButton(String name, Function func, Color bkColor, Widget child) {
    return Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 20)),
        SizedBox.fromSize(
          size: Size(40, 40),
          child: RaisedButton(
            padding: EdgeInsets.only(left: 0, right: 0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            color: bkColor,
            child: child,
            onPressed: func,
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 9.5)),
        Text(
          name,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
