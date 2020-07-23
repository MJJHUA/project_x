import 'package:flutter/material.dart';
import 'package:projectx/base/application.dart';
import 'package:projectx/models/design.dart';
import 'package:projectx/viewmodels/design_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:projectx/views/widget/form_button_widget.dart';
import 'package:projectx/views/widget/form_item_widget.dart';
import 'package:projectx/base/common.dart';
import 'package:projectx/base/my_icons.dart';
import 'package:projectx/views/widget/image_list_widget.dart';

class DesignUpdatePage extends StatefulWidget {
  final int customerId;
  DesignUpdatePage({Key key, this.customerId}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DesignUpdatePage();
  }
}

class _DesignUpdatePage extends State<DesignUpdatePage> {
  Design _design = Design();
  final DesignViewModel _designViewModel = DesignViewModel();
  bool _isAdd = true;
  FormItemTextFieldWidget _designNameWidget;
  final _remarkTextController = new TextEditingController();
  ImageListWidget _imageListWidget;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // 初始化数据
    if (DesignStateSubject.instance.design != null) {
      _isAdd = false;
      _design = Design.copyModel(DesignStateSubject.instance.design);
    } else {
      _design = Design.initData();
    }
    _designNameWidget = FormItemTextFieldWidget(
      title: "方案名称",
      text: _design.name,
      hitText: "填写方案名称",
    );
    _remarkTextController.text = _design.remark;
    _imageListWidget = ImageListWidget(
      remoteImages: _design.images,
      hasCamera: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("build..............");

    return Scaffold(
      appBar: AppBar(
        title: Text((_isAdd) ? "添加设计方案" : "修改设计方案"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          _designNameWidget,
                          Padding(
                            padding: EdgeInsets.only(left: 30.w),
                            child: Divider(
                              height: 2.h,
                            ),
                          ),
                          FormItemWidget(
                            title: "方案风格",
                            content: _design.style,
                            child: Icon(MyIcons.tongyongjinruxuanze),
                            func: () => popStyleList(context),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30.w),
                            child: Divider(
                              height: 2.h,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              DatePicker.showDateTimePicker(
                                context,
                                showTitleActions: true,
                                onChanged: (date) {},
                                onConfirm: (date) {
                                  setState(() {
                                    _design.designTime =
                                        Common.formatDateTime(date);
                                  });
                                },
                                locale: LocaleType.zh,
                                currentTime: DateTime.now(),
                                theme: DatePickerTheme(
                                  doneStyle: TextStyle(color: Colors.teal),
                                ),
                              );
                            },
                            child: FormItemWidget(
                              title: "设计时间",
                              content: _design.designTime,
                              child: Icon(MyIcons.tongyongjinruxuanze),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30.w),
                            child: Divider(
                              height: 2.h,
                            ),
                          ),
                          Container(
                            height: 180.h,
                            child: TextField(
                              style: TextStyle(fontSize: 28.sp),
                              controller: this._remarkTextController,
                              keyboardType: TextInputType.multiline,
                              maxLines: 2,
                              maxLength: 100,
                              decoration: InputDecoration(
                                hintText: '填写方案描述',
                                hintStyle: TextStyle(
                                    fontSize: 28.sp, color: Color(0xFFCCCCCC)),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 20.h, horizontal: 30.w),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20.h)),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
                    color: Colors.white,
                    width: double.infinity,
                    child: _imageListWidget,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: FormButtonWidget(
              title: "确定",
              func: () {
                Common.netWorkLoading(
                  callback: () {
                    this.wrapSubmitData();
                    if (_isAdd) {
                      return _designViewModel.addDesignInfo(_design,
                          widget.customerId, _imageListWidget.addImageFiles);
                    } else {
                      return _designViewModel.updateDesignInfo(
                          _design,
                          _imageListWidget.addImageFiles,
                          _imageListWidget.delImageIds);
                    }
                  },
                  onSuccess: () {
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  popStyleList(BuildContext context) {
    Map<String, Function> popItem = Map<String, Function>();
    Application.settings.zxType.forEach((element) {
      popItem[element.v] = () {
        setState(() {
          _design.styleId = element.k;
          _design.style = element.v;
        });
      };
    });
    Common.popupBottomMenu(context, popItem);
  }

  wrapSubmitData() {
    _design.remark = _remarkTextController.text;
  }
}
