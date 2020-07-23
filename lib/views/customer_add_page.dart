import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectx/views/attribute_page.dart';
import 'package:projectx/views/widget/form_item_widget.dart';
import 'package:projectx/viewmodels/customer_controller.dart';
import 'package:projectx/base/my_icons.dart';
import 'widget/form_button_widget.dart';
import 'package:projectx/models/attributes.dart';

class CustomerUpdatePage extends StatefulWidget {
  final int customerId;

  CustomerUpdatePage({Key key, this.customerId}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CustomerUpdatePage();
  }
}

class _CustomerUpdatePage extends State<CustomerUpdatePage> {
  final CustomerViewModel _customerController = CustomerViewModel();
  Attribute _selectedGender = Attribute(k: -1, v: "");
  Attribute _selectedRoomType = Attribute(k: -1, v: "");
  Attribute _selectedLayoutType = Attribute(k: -1, v: "");
  Attribute _selectedZxType = Attribute(k: -1, v: "");
  Attribute _selectedBusinessType = Attribute(k: -1, v: "");
  Attribute _selectedChannel = Attribute(k: -1, v: "");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String pageTitle = (widget.customerId == null) ? "添加客户" : "编辑客户";
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              top: 20.h,
            ),
          ),
          Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                FormItemWidget(
                  title: "客户姓名",
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30.w),
                  child: Divider(
                    height: 2.h,
                  ),
                ),
                FormItemWidget(
                  title: "客户性别",
                  content: _selectedGender.v,
                  child: Icon(
                    MyIcons.tongyongjinruxuanze,
                  ),
                  func: toGenderPage,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30.w),
                  child: Divider(
                    height: 2.h,
                  ),
                ),
                FormItemWidget(
                  title: "客户电话",
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30.w),
                  child: Divider(
                    height: 2.h,
                  ),
                ),
                FormItemWidget(
                  title: "客户地址",
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30.w),
                  child: Divider(
                    height: 2.h,
                  ),
                ),
                FormItemWidget(
                  title: "房屋类型",
                  content: _selectedRoomType.v,
                  child: Icon(
                    MyIcons.tongyongjinruxuanze,
                  ),
                  func: toRoomTypePage,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30.w),
                  child: Divider(
                    height: 2.h,
                  ),
                ),
                FormItemWidget(
                  title: "房屋面积",
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30.w),
                  child: Divider(
                    height: 2.h,
                  ),
                ),
                FormItemWidget(
                  title: "房屋户型",
                  content: _selectedLayoutType.v,
                  child: Icon(
                    MyIcons.tongyongjinruxuanze,
                  ),
                  func: toLayoutTypePage,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30.w),
                  child: Divider(
                    height: 2.h,
                  ),
                ),
                FormItemWidget(
                  title: "装修风格",
                  content: _selectedZxType.v,
                  child: Icon(
                    MyIcons.tongyongjinruxuanze,
                  ),
                  func: toZxTypePage,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30.w),
                  child: Divider(
                    height: 2.h,
                  ),
                ),
                FormItemWidget(
                  title: "业务类型",
                  content: _selectedBusinessType.v,
                  child: Icon(
                    MyIcons.tongyongjinruxuanze,
                  ),
                  func: toBusinessTypePage,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30.w),
                  child: Divider(
                    height: 2.h,
                  ),
                ),
                FormItemWidget(
                  title: "渠道来源",
                  content: _selectedChannel.v,
                  child: Icon(
                    MyIcons.tongyongjinruxuanze,
                  ),
                  func: toChannelPage,
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 20.h)),
          FormButtonWidget(
            title: "确定",
            func: null,
          ),
        ],
      ),
    );
  }

  void toGenderPage() {
    List<Attribute> attributeList = List<Attribute>();
    attributeList.add(Attribute(k: 0, v: "男"));
    attributeList.add(Attribute(k: 1, v: "女"));
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AttributePage(
            title: "性别",
            attributeList: attributeList,
            attribute: _selectedGender,
          )),
    ).then((result) {
      setState(() {
        if (result != null) {
          _selectedGender.k = result.k;
          _selectedGender.v = result.v;
        }
      });
    });
  }
  void toRoomTypePage() {
    List<Attribute> attributeList = List<Attribute>();
    attributeList.add(Attribute(k: 0, v: "公寓"));
    attributeList.add(Attribute(k: 1, v: "大平层"));
    attributeList.add(Attribute(k: 2, v: "别墅"));
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AttributePage(
            title: "房屋类型",
            attributeList: attributeList,
            attribute: _selectedRoomType,
          )),
    ).then((result) {
      setState(() {
        if (result != null) {
          _selectedRoomType.k = result.k;
          _selectedRoomType.v = result.v;
        }
      });
    });
  }
  void toLayoutTypePage() {
    List<Attribute> attributeList = List<Attribute>();
    attributeList.add(Attribute(k: 0, v: "一室一厅"));
    attributeList.add(Attribute(k: 1, v: "二室一厅"));
    attributeList.add(Attribute(k: 2, v: "二室二厅"));
    attributeList.add(Attribute(k: 3, v: "三室一厅"));
    attributeList.add(Attribute(k: 4, v: "三室二厅"));
    attributeList.add(Attribute(k: 5, v: "四室二厅"));
    attributeList.add(Attribute(k: 6, v: "四室三厅"));
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AttributePage(
            title: "房屋户型",
            attributeList: attributeList,
            attribute: _selectedLayoutType,
          )),
    ).then((result) {
      setState(() {
        if (result != null) {
          _selectedLayoutType.k = result.k;
          _selectedLayoutType.v = result.v;
        }
      });
    });
  }
  void toZxTypePage() {
    List<Attribute> attributeList = List<Attribute>();
    attributeList.add(Attribute(k: 0, v: "田园"));
    attributeList.add(Attribute(k: 1, v: "美式"));
    attributeList.add(Attribute(k: 2, v: "简约"));
    attributeList.add(Attribute(k: 3, v: "中式"));
    attributeList.add(Attribute(k: 4, v: "欧式"));
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AttributePage(
            title: "装修风格",
            attributeList: attributeList,
            attribute: _selectedZxType,
          )),
    ).then((result) {
      setState(() {
        if (result != null) {
          _selectedZxType.k = result.k;
          _selectedZxType.v = result.v;
        }
      });
    });
  }
  void toBusinessTypePage() {
    List<Attribute> attributeList = List<Attribute>();
    attributeList.add(Attribute(k: 0, v: "全包"));
    attributeList.add(Attribute(k: 1, v: "半包"));
    attributeList.add(Attribute(k: 2, v: "清包"));
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AttributePage(
            title: "业务类型",
            attributeList: attributeList,
            attribute: _selectedBusinessType,
          )),
    ).then((result) {
      setState(() {
        if (result != null) {
          _selectedBusinessType.k = result.k;
          _selectedBusinessType.v = result.v;
        }
      });
    });
  }
  void toChannelPage() {
    List<Attribute> attributeList = List<Attribute>();
    attributeList.add(Attribute(k: 0, v: "线下"));
    attributeList.add(Attribute(k: 1, v: "网络"));
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AttributePage(
            title: "渠道来源",
            attributeList: attributeList,
            attribute: _selectedChannel,
          )),
    ).then((result) {
      setState(() {
        if (result != null) {
          _selectedChannel.k = result.k;
          _selectedChannel.v = result.v;
        }
      });
    });
  }
}
