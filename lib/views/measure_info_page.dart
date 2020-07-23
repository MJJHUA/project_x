import 'package:flutter/material.dart';
import 'package:projectx/base/common.dart';
import 'package:projectx/models/measure.dart';
import 'package:projectx/viewmodels/measure_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widget/image_list_widget.dart';
import 'package:projectx/base/application.dart';
import 'package:projectx/base/routes.dart';

class MeasureInfoPage extends StatefulWidget {
  final int customerId;
  MeasureInfoPage({Key key, @required this.customerId}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MeasureInfoPage();
  }
}

class _MeasureInfoPage extends State<MeasureInfoPage> {
  final _measureViewModel = MeasureViewModel();
  Map<String, Function> _topRightItems;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _topRightItems = {
      "完成": measureCompleted,
      "修改": updateMeasureRecord,
      "删除": delMeasureRecord
    };
    // 初始化网络数据
    _measureViewModel.getMeasureInfo(widget.customerId);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // 关闭共享数据单例
    MeasureStateSubject.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StreamBuilder<Measure>(
      stream: MeasureStateSubject.instance.measureStream,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Text("none");
          case ConnectionState.done:
            {
              return Text("done");
            }
          case ConnectionState.waiting:
            return Container(
              color: Colors.grey[200],
              child: Center(
                child: CircularProgressIndicator(),
              ),
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
    );

//    );
  }

  // 没有数据的页面展示
  Widget noDataWidget() {
    return Scaffold(
      appBar: AppBar(
        title: Text("量房记录"),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "暂无量房记录",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFFCCCCCC),
            fontSize: 36.sp,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Application.router.navigateTo(context,
              Routes.measureUpdate + "?id=${widget.customerId.toString()}");
        },
        child: Icon(Icons.add),
      ),
    );
  }

  // 有数据的页面展示
  Widget hasDataWidget(Measure measure) {
    List<String> _images = List<String>();
    measure.images.forEach((element) {
      _images.add(element.url);
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("量房记录"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {
                Common.popupSelectMenu(context, _topRightItems);
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 40.h),
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        "房间数量",
                        style: TextStyle(
                          color: Color(0xFF666666),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(left: 80.w)),
                      Text(
                        "${measure.roomNum.toString()} 室 "
                        "${measure.parlorNum.toString()} 厅 "
                        "${measure.kitchenNum.toString()} 厨 "
                        "${measure.toiletNum.toString()} 卫 "
                        "${measure.balconyNum.toString()} 阳台",
                        style: TextStyle(color: Color(0xFF333333)),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 40.h)),
                  Row(
                    children: <Widget>[
                      Text(
                        "实用面积",
                        style: TextStyle(
                          color: Color(0xFF666666),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(left: 80.w)),
                      Text(
                        "${measure.area.toString()} m2",
                        style: TextStyle(color: Color(0xFF333333)),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 40.h)),
                  Row(
                    children: <Widget>[
                      Text(
                        "量  房  人",
                        style: TextStyle(
                          color: Color(0xFF666666),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(left: 80.w)),
                      Text(
                        "${measure.measureBy}",
                        style: TextStyle(color: Color(0xFF333333)),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 40.h)),
                  Row(
                    children: <Widget>[
                      Text(
                        "量房时间",
                        style: TextStyle(
                          color: Color(0xFF666666),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(left: 80.w)),
                      Text(
                        "${measure.lfTime}",
                        style: TextStyle(color: Color(0xFF333333)),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 40.h)),
                  Divider(
                    height: 2.h,
                  ),
                  Padding(padding: EdgeInsets.only(top: 40.h)),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${measure.remark}",
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 40.h)),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ImageListWidget(remoteImagePaths: _images),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 量房完成
  measureCompleted() {
    print("measure completed...........");
  }

  // 修改量房记录
  updateMeasureRecord() {
    Application.router.navigateTo(
        context, Routes.measureUpdate + "?id=${widget.customerId.toString()}");
  }

  // 删除量房记录
  delMeasureRecord() {
    Common.netWorkLoading(
      callback: () {
        return _measureViewModel.delMeasureInfo(MeasureStateSubject.instance.measure.id);
      },
    );
  }
}
