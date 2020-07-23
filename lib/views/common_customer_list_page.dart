import 'package:flutter/material.dart';
import 'package:projectx/models/common_customer.dart';
import 'package:projectx/viewmodels/common_customer_controller.dart';
import 'package:projectx/base/application.dart';
import 'package:projectx/base/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CommonCustomerListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CommonCustomerListPage();
  }
}

class _CommonCustomerListPage extends State<CommonCustomerListPage> {
  List<CommonCustomer> _commonCustomerList;
  final CommonCustomerViewModel _commonCustomerController =
      CommonCustomerViewModel();
  final RefreshController _refreshController =
      RefreshController(initialRefresh: true);
  bool _hasNoData = false;
  bool _selectedHide = true;
  List<bool> _selected = List<bool>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _commonCustomerList = List<CommonCustomer>();
  }

  void _onRefresh() async {
    var list = await _commonCustomerController.getCommonCustomerList();
    if (mounted) {
      setState(() {
        _commonCustomerList.clear();
        _commonCustomerList.addAll(list);
        _selected.clear();
        list.forEach((v) {
          _selected.add(false);
        });
        _hasNoData = (list.length == 0);
      });
    }

    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    var list = await _commonCustomerController.getCommonCustomerList();
    if (mounted) {
      setState(() {
        _commonCustomerList.addAll(list);
        list.forEach((v) {
          _selected.add(false);
        });
      });
    }
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("公海客户"),
        centerTitle: true,
      ),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: ClassicHeader(),
        footer: ClassicFooter(),
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        controller: _refreshController,
        child: buildListView(),
      ),
    );
  }

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
        return _customerItem(_commonCustomerList, index);
      },
      itemCount: _commonCustomerList.length,
    );
  }

  // 客户列表item
  Widget _customerItem(List<CommonCustomer> data, int index) {
    return Container(
      child: Row(
        children: <Widget>[
          Offstage(
            offstage: _selectedHide,
            child: Checkbox(
              value: _selected[index],
              activeColor: Colors.teal,
              onChanged: (bool val) {
                setState(() {
                  _selected[index] = val;
                });
              },
            ),
          ),
          Offstage(
        offstage: !_selectedHide,
        child: Padding(padding: EdgeInsets.only(left: 30.w)),
      ),
          Expanded(
            child:GestureDetector(
              onLongPress: (){
                setState(() {
                  _selectedHide = false;
                });
              },
              onTap: () {
                if(_selectedHide) {
                  Application.router.navigateTo(
                      context,
                      Routes.commonCustomerInfo +
                          "/" +
                          data[index].id.toString());
                } else {
                  setState(() {
                    _selectedHide = true;
                  });
                }
              },
              child: Container(
                    color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        top: 21.h,
                        bottom: 21.h,
                      ),
                      child: Row(
                        children: <Widget>[
                          Text(
                            data[index].name,
                            style: TextStyle(
                                color: Color(0xFF333333), fontSize: 28.sp),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(right: 30.w),
                              child: Text(
                                data[index].createTime,
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
                      padding: EdgeInsets.only(
                          bottom: 21.h
                      ),
                      child: Text(
                        data[index].mobile,
                        style: TextStyle(
                          color: Color(0xFF999999),
                          fontSize: 24.sp,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: 21.h
                      ),
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
              ),
            ),

          ),
        ],
      ),
      //container的border这里只要求有个bottom的border
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
    );
  }
}
