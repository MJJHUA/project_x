import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:projectx/base/my_icons.dart';
import 'package:projectx/views/widget/toggle_button.dart';
import 'package:projectx/base/application.dart';
import 'package:projectx/base/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:projectx/viewmodels/customer_controller.dart';
import 'package:projectx/models/customer.dart';

class CustomerListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CustomerListPage();
  }
}

class _CustomerListPage extends State<CustomerListPage> {
  List<CustomerInfo> _customerList = List<CustomerInfo>();
  final CustomerViewModel _customerController = CustomerViewModel();
  final RefreshController _refreshController =
      RefreshController(initialRefresh: true);
  bool _hasNoData = false;
  bool filterHide = true;
  final List<int> stageFilterValues = List<int>();
  final List<int> markFilterValues = List<int>();
  final List<int> trackFilterValues = List<int>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    _customerController.getCustomerList().then((value) {
//      setState(() {
//        _customerList = value;
//      });
//    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("客户"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                filterHide = !filterHide;
              });
            },
            child: Container(
              height: 82.h,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey[200],
                    width: 2.w,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "筛选",
                    style: TextStyle(color: Colors.teal),
                  ),
                  Padding(padding: EdgeInsets.only(left: 10.w)),
                  Icon(
                    MyIcons.tongyongshaixuan,
                    color: Colors.teal,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: <Widget>[
                // 列表
                SmartRefresher(
                  enablePullDown: true,
                  enablePullUp: true,
                  header: ClassicHeader(),
                  footer: ClassicFooter(),
                  onRefresh: _onRefresh,
                  onLoading: _onLoading,
                  controller: _refreshController,
                  child: buildListView(),
                ),
                // 遮罩
                Offstage(
                  offstage: filterHide,
                  child: Container(
                    color: Color.fromARGB(70, 0, 0, 0),
                  ),
                ),
                // 筛选框
                Offstage(
                  offstage: filterHide,
                  child: Container(
                    alignment: Alignment.center,
                    height: double.infinity,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Column(
                      children: <Widget>[
                        // 筛选项
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // 客户阶段
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 40.h, bottom: 30.h, left: 30.w),
                                child: Text(
                                  "客户阶段",
                                  style: TextStyle(
                                    fontSize: 28.sp,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 50.w),
                                child: Wrap(
                                  spacing: 30.w,
                                  runSpacing: 30.h,
                                  children: stageFilter(),
                                ),
                              ),

                              Padding(padding: EdgeInsets.only(top: 30.h)),
                              Divider(
                                height: 2.h,
                              ),
                              //客户标记
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 40.h, bottom: 30.h, left: 30.w),
                                child: Text(
                                  "客户标记",
                                  style: TextStyle(
                                    fontSize: 28.sp,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 50.w),
                                child: Wrap(
                                  spacing: 30.w,
                                  runSpacing: 30.h,
                                  children: markFilter(),
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top: 30.h)),
                              Divider(
                                height: 2.h,
                              ),
                              //客户跟进
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 40.h, bottom: 30.h, left: 30.w),
                                child: Text(
                                  "客户跟进",
                                  style: TextStyle(
                                    fontSize: 28.sp,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 50.w),
                                child: Wrap(
                                  spacing: 30.w,
                                  runSpacing: 30.h,
                                  children: trackFilter(),
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top: 30.h)),
                              Divider(
                                height: 2.h,
                              ),
                            ],
                          ),
                        ),
                        // 确定按钮
                        FlatButton(
                          onPressed: () {
                            print(stageFilterValues);
                            print(markFilterValues);
                            print(trackFilterValues);
                            _refreshController.requestRefresh();
                            setState(() {
                              filterHide = !filterHide;
                            });
                          },
                          child: Container(
                            width: double.infinity,
                            height: 80.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              "确定",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 36.sp),
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 20.h)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 列表
  Widget buildListView() {
    if (_hasNoData)
      return Center(
        child: Text(
          "无公海客户数据",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFFCCCCCC),
            fontSize: 36.sp,
          ),
        ),
      );

    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return _customerItem(_customerList, index);
      },
      itemCount: _customerList.length,
    );
  }

  // 客户列表item
  Widget _customerItem(List<CustomerInfo> data, int index) {
    return GestureDetector(
      onTap: () {
        Application.router.navigateTo(
            context, Routes.customerInfo + "/" + data[index].id.toString());
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: 21.h,
                bottom: 21.h,
                left: 30.w,
              ),
              child: Row(
                children: <Widget>[
                  Text(
                    data[index].name,
                    style: TextStyle(color: Color(0xFF333333), fontSize: 28.sp),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(right: 30.w),
                      child: Text(
                        data[index].allotTime,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xFF999999),
                          fontSize: 24.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w, bottom: 21.h),
              child: Text(
                data[index].mobile,
                style: TextStyle(
                  color: Color(0xFF999999),
                  fontSize: 24.sp,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w, bottom: 21.h),
              child: Text(
                data[index].address,
                style: TextStyle(
                  color: Color(0xFF666666),
                  fontSize: 24.sp,
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              color: Colors.grey[200],
              width: 2.w,
              style: BorderStyle.solid,
            ),
          ),
        ),
      ),
    );
  }

  // 刷新
  void _onRefresh() async {
    var list = await _customerController.getCustomerList();
    if (mounted) {
      setState(() {
        _customerList.clear();
        _customerList.addAll(list);
      });
    }
    _hasNoData = (list.length == 0);
    _refreshController.refreshCompleted();
  }

  // 加载
  void _onLoading() async {
    var list = await _customerController.getCustomerList();
    if (mounted) {
      setState(() {
        _customerList.addAll(list);
      });
    }
    _refreshController.loadComplete();
  }

  List<Widget> stageFilter() {
    List stages = List();
    stages.add({"id": 1, "value": "量房"});
    stages.add({"id": 2, "value": "设计"});
    stages.add({"id": 3, "value": "报价"});
    stages.add({"id": 4, "value": "签约"});
    stages.add({"id": 5, "value": "施工"});

    List<Widget> filter = List<Widget>();
    stages.forEach((element) {
      filter.add(ToggleButton(
        element,
        selectedValues: stageFilterValues,
      ));
    });

    return filter;
  }

  List<Widget> markFilter() {
    List marks = List();
    marks.add({"id": 1, "value": "潜在"});
    marks.add({"id": 2, "value": "意向"});
    marks.add({"id": 3, "value": "重要"});

    List<Widget> filter = List<Widget>();
    marks.forEach((element) {
      filter.add(ToggleButton(
        element,
        selectedValues: markFilterValues,
      ));
    });

    return filter;
  }

  List<Widget> trackFilter() {
    List tracks = List();
    tracks.add({"id": 1, "value": "量房"});
    tracks.add({"id": 2, "value": "设计"});
    tracks.add({"id": 3, "value": "报价"});
    tracks.add({"id": 4, "value": "签约"});
    tracks.add({"id": 5, "value": "施工"});

    List<Widget> filter = List<Widget>();
    tracks.forEach((element) {
      filter.add(ToggleButton(
        element,
        selectedValues: trackFilterValues,
      ));
    });

    return filter;
  }
}
