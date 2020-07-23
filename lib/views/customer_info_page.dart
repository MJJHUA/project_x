import 'package:flutter/material.dart';
import 'widget/popup_menu.dart';
import 'widget/tabbar_info.dart';
import 'widget/tabbar_menu.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectx/models/customer.dart';
import 'package:projectx/viewmodels/customer_controller.dart';

class CustomerInfoPage extends StatefulWidget {
  final int customerId;

  CustomerInfoPage({Key key, @required this.customerId}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CustomerInfoPage();
  }
}

class _CustomerInfoPage extends State<CustomerInfoPage>
    with TickerProviderStateMixin {
  final CustomerViewModel _customerController = CustomerViewModel();
  var _customerInfoFuture;
  TabController _tabController;
  var _tabs;
  var _tabViews;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(vsync: this, length: 3);
    _customerInfoFuture = _customerController.getCustomerInfo(widget.customerId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //test data
    MenuItem item1 = MenuItem("热度21", () {
      print("object111");
    });
    MenuItem item2 = MenuItem("最新2", () {
      print("object2222");
    });

    //test data
    Map<int, MenuItem> items = new Map();
    items[0] = item1;
    items[1] = item2;

    _tabs = <Tab>[
//      Tab(
//        text: "动态",
//      ),
      Tab(
        text: "详情",
      ),
      Tab(
        text: "团队",
      ),
      Tab(
        text: "菜单",
      ),
    ];

    _tabViews = [
      TabBarMenuWidget(),
      TabBarMenuWidget(),
      TabBarMenuWidget(),

    ];

    // TODO: implement build
    return Scaffold(
//      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("客户"),
        centerTitle: true,
        actions: <Widget>[
          PopupMenu(items),
        ],
      ),
      body: FutureBuilder<Customer>(
        future: _customerInfoFuture,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text("none");
            case ConnectionState.active:
              return Text("active");
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator(),);
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Text("error");
              }
              return Column(
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    height: 190.h,
                    padding: EdgeInsets.only(left: ScreenUtil().setWidth(29)),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding:
                              EdgeInsets.only(top: ScreenUtil().setHeight(29)),
                        ),
                        Row(
                          children: <Widget>[
                            Text(snapshot.data.customerInfo.name),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: ScreenUtil().setWidth(20)),
                            ),
                            Text(snapshot.data.customerInfo.mobile),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text(snapshot.data.customerInfo.address),
                              ],
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerRight,
                                padding: EdgeInsets.only(
                                    right: ScreenUtil().setWidth(40)),
                                child: Icon(
                                  Icons.phone,
                                  color: Colors.teal,
                                ),

//                      ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text("宝山区锦秋路699弄(锦秋花园)56号102室"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding:
                          EdgeInsets.only(top: ScreenUtil().setHeight(20))),
                  Container(
                    color: Colors.white,
                    child: TabBar(
                      controller: _tabController,
                      tabs: _tabs,
                    ),
                  ),
                  Divider(height: 2.h),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: generateTabView(snapshot.data),
//        children: TabBarView(children: null),
                    ),
                  ),
                ],
              );
          }
          return null;
        },
      ),
    );
  }

  List<Widget> generateTabView(Customer customer) {
    List<Widget> tabViews = List<Widget>();
    var infoView = TabBarInfoWidget(customerInfo: customer.customerInfo, );
    var menuView = TabBarMenuWidget(menuInfoList: customer.menuInfo,);
    tabViews.add(infoView);
    tabViews.add(infoView);
    tabViews.add(menuView);
    return tabViews;
  }

  Widget tabView() {
    return TabBar(
      controller: _tabController,
      tabs: <Widget>[
        Tab(
          icon: Icon(Icons.add),
        ),
        Tab(
          icon: Icon(Icons.add),
        ),
        Tab(
          icon: Icon(Icons.add),
        ),
        Tab(
          icon: Icon(Icons.add),
        ),
      ],
    );
  }


  _onSuccess(Customer customer) {}
}
