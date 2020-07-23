import 'package:flutter/material.dart';
import 'package:projectx/models/customer.dart';

class TabBarInfoWidget extends StatelessWidget {

  final CustomerInfo customerInfo;

  TabBarInfoWidget({Key key, @required this.customerInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
              ),
              child: Row(
                children: <Widget>[
                  Text("客户姓名"),
                  Padding(
                    padding: EdgeInsets.only(left: 44),
                    child: Text(this.customerInfo.name),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
              ),
              child: Row(
                children: <Widget>[
                  Text("客户性别"),
                  Padding(
                    padding: EdgeInsets.only(left: 44),
                    child: Text(this.customerInfo.sex),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
              ),
              child: Row(
                children: <Widget>[
                  Text("手机号码"),
                  Padding(
                    padding: EdgeInsets.only(left: 44),
                    child: Text(this.customerInfo.mobile),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
              ),
              child: Row(
                children: <Widget>[
                  Text(
                    "装修地址",
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 44),
                  ),
                  Expanded(
                    child: Text(this.customerInfo.address),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
              ),
              child: Row(
                children: <Widget>[
                  Text("房屋类型"),
                  Padding(
                    padding: EdgeInsets.only(left: 44),
                    child: Text(this.customerInfo.roomType),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
              ),
              child: Row(
                children: <Widget>[
                  Text("房屋面积"),
                  Padding(
                    padding: EdgeInsets.only(left: 44),
                    child: Text(this.customerInfo.area.toString()),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
              ),
              child: Row(
                children: <Widget>[
                  Text("房屋户型"),
                  Padding(
                    padding: EdgeInsets.only(left: 44),
                    child: Text(this.customerInfo.layoutType),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
              ),
              child: Row(
                children: <Widget>[
                  Text("装修风格"),
                  Padding(
                    padding: EdgeInsets.only(left: 44),
                    child: Text(this.customerInfo.zxType),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
              ),
              child: Row(
                children: <Widget>[
                  Text("业务类型"),
                  Padding(
                    padding: EdgeInsets.only(left: 44),
                    child: Text(this.customerInfo.businessType),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
              ),
              child: Row(
                children: <Widget>[
                  Text("渠道来源"),
                  Padding(
                    padding: EdgeInsets.only(left: 44),
                    child: Text(this.customerInfo.channel),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
