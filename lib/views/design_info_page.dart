import 'package:flutter/material.dart';
import 'package:projectx/models/design.dart';
import 'package:projectx/models/images.dart';
import 'package:projectx/viewmodels/design_controller.dart';
import 'package:projectx/base/common.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectx/views/widget/image_list_widget.dart';
import 'package:projectx/base/application.dart';
import 'package:projectx/base/routes.dart';

class DesignInfoPage extends StatefulWidget {
  final int customerId;
  DesignInfoPage({Key key, @required this.customerId}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DesignInfoPage();
  }
}

class _DesignInfoPage extends State<DesignInfoPage> {
  final DesignViewModel _designViewModel = DesignViewModel();
  Map<String, Function> _topRightItems;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _topRightItems = {"修改": updateDesign, "删除": delDesign};
  }

  @override
  void dispose() {
    // TODO: implement dispose
    DesignStateSubject.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("设计方案"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {
                Common.popupSelectMenu(context, _topRightItems);
              }),
        ],
      ),
      body: StreamBuilder<Design>(
        stream: DesignStateSubject.instance.designStream,
        initialData: DesignStateSubject.instance.design,
        builder: (context, snapshot) {
          return dataWidget(snapshot.data);
        },
      ),
    );
  }

  Widget dataWidget(Design design) {
    List<String> _images = List<String>();
    design.images.forEach((element) {
      _images.add(element.url);
    });
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 40.h),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  "方案名称",
                  style: TextStyle(
                    color: Color(0xFF666666),
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 80.w)),
                Text(
                  design.name,
                  style: TextStyle(color: Color(0xFF333333)),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 40.h)),
            Row(
              children: <Widget>[
                Text(
                  "方案风格",
                  style: TextStyle(
                    color: Color(0xFF666666),
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 80.w)),
                Text(
                  design.style,
                  style: TextStyle(color: Color(0xFF333333)),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 40.h)),
            Row(
              children: <Widget>[
                Text(
                  "设  计  师",
                  style: TextStyle(
                    color: Color(0xFF666666),
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 80.w)),
                Text(
                  design.designBy,
                  style: TextStyle(color: Color(0xFF333333)),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 40.h)),
            Row(
              children: <Widget>[
                Text(
                  "设计时间",
                  style: TextStyle(
                    color: Color(0xFF666666),
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 80.w)),
                Text(
                  design.designTime,
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
                design.remark,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 40.h)),
            Align(
              alignment: Alignment.centerLeft,
              child: ImageListWidget(remoteImagePaths: _images),
            ),
          ],
        ),
      ),
    );
  }

  updateDesign() {
    Application.router.navigateTo(
        context,
        Routes.designUpdate +
            "?customer_id=${widget.customerId.toString()}");
  }

  delDesign() {}
}
