import 'package:flutter/material.dart';
import 'package:projectx/models/common_customer.dart';
import 'package:projectx/viewmodels/common_customer_controller.dart';
import 'widget/null_text_wrap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonCustomerInfoPage extends StatefulWidget {
  final int customerId;

  CommonCustomerInfoPage({Key key, @required this.customerId})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CommonCustomerInfoPage();
  }
}

class _CommonCustomerInfoPage extends State<CommonCustomerInfoPage> {
  final CommonCustomerViewModel _commonCustomerController =
      CommonCustomerViewModel();
  var _commonCustomerInfoFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _commonCustomerInfoFuture =
        _commonCustomerController.getCommonCustomerInfo(widget.customerId);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
//      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("客户详情"),
        centerTitle: true,
        actions: <Widget>[],
      ),
      body: FutureBuilder<CommonCustomer>(
        future: _commonCustomerInfoFuture,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text("none");
            case ConnectionState.active:
              return Text("active");
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Text("error");
              }
              return Container(
                height: 904.h,
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
                          Text(
                            "客户姓名",
                            style: TextStyle(color: Color(0xFF666666)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 44),
                            child: NullTextWrap(text: snapshot.data.name),
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
                            "客户性别",
                            style: TextStyle(color: Color(0xFF666666)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 44),
                            child: NullTextWrap(text: snapshot.data.sex),
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
                            "手机号码",
                            style: TextStyle(color: Color(0xFF666666)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 44),
                            child: NullTextWrap(text: snapshot.data.mobile),
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
                            style: TextStyle(color: Color(0xFF666666)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 44),
                          ),
                          Expanded(
                            child: NullTextWrap(text: snapshot.data.address),
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
                            "房屋类型",
                            style: TextStyle(color: Color(0xFF666666)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 44),
                            child: NullTextWrap(text: snapshot.data.roomType),
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
                            "房屋面积",
                            style: TextStyle(color: Color(0xFF666666)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 44),
                            child:
                            NullTextWrap(text: snapshot.data.area.toString()),
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
                            "房屋户型",
                            style: TextStyle(color: Color(0xFF666666)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 44),
                            child: NullTextWrap(text: snapshot.data.layoutType),
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
                            "装修风格",
                            style: TextStyle(color: Color(0xFF666666)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 44),
                            child: NullTextWrap(text: snapshot.data.zxType),
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
                            "业务类型",
                            style: TextStyle(color: Color(0xFF666666)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 44),
                            child: NullTextWrap(text: snapshot.data.businessType),
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
                            "渠道来源",
                            style: TextStyle(color: Color(0xFF666666)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 44),
                            child: NullTextWrap(text: snapshot.data.channel),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );

          }
          return null;
        },
      ),
    );
  }
}
