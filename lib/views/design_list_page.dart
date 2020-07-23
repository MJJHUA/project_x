import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectx/base/application.dart';
import 'package:projectx/base/routes.dart';
import 'package:projectx/models/design.dart';
import 'package:projectx/viewmodels/design_controller.dart';

class DesignListPage extends StatefulWidget {
  final int customerId;

  DesignListPage({Key key, @required this.customerId}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DesignListPage();
  }
}

class _DesignListPage extends State<DesignListPage> {
  final DesignViewModel _designViewModel = DesignViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _designViewModel.getDesignList(widget.customerId);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // 关闭共享数据单例
    DesignListStateSubject.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
//      backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text("设计方案"),
          centerTitle: true,
        ),
        body: StreamBuilder<List<Design>>(
          stream: DesignListStateSubject.instance.designListStream,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Text("none");
              case ConnectionState.done:
                {
                  return Text("done");
                }
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.active:
                if (snapshot.hasError) {
                  return Text("error");
                }
                if (snapshot.data == null) {
                  return noDataWidget();
                } else {
                  return hasDataWidget(snapshot.data);
                }
            }
            return null;
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Application.router.navigateTo(
                context,
                Routes.designUpdate +
                    "?customer_id=${widget.customerId.toString()}");
          },
          child: Icon(Icons.add),
        ));
  }

  // 没有数据的页面展示
  Widget noDataWidget() {
    return Column(
      children: <Widget>[
        Expanded(
          child: Center(
            child: Text(
              "暂无设计方案",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFCCCCCC),
                fontSize: 36.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // 有数据的页面展示
  Widget hasDataWidget(List<Design> designList) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return _designItem(designList, index);
      },
      itemCount: designList.length,
    );
  }

  // 列表item
  Widget _designItem(List<Design> data, int index) {
    return GestureDetector(
      onTap: () {
        _designViewModel.getDesignInfo(index);
        Application.router.navigateTo(
            context,
            Routes.designInfo +
                "?customer_id=${widget.customerId.toString()}");
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
                    style: TextStyle(
                      fontSize: 28.sp,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(right: 30.w),
                      child: Text(
                        (data[index].approved == 0) ? "" : "已采纳",
                        textAlign: TextAlign.right,
                        style: TextStyle(
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
                data[index].style + " - " + data[index].designBy,
                style: TextStyle(
                  fontSize: 24.sp,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w, bottom: 21.h),
              child: Text(
                data[index].designTime,
                style: TextStyle(
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
}
