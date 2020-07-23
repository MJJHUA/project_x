import 'package:flutter/material.dart';
import 'package:projectx/models/measure.dart';
import 'package:projectx/views/widget/image_list_widget.dart';
import 'package:projectx/views/widget/number_operation.dart';
import 'package:projectx/viewmodels/measure_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectx/views/widget/form_item_widget.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:projectx/base/common.dart';
import 'package:projectx/base/my_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:projectx/views/widget/form_button_widget.dart';

class MeasureUpdatePage extends StatefulWidget {
  final int customerId;

  MeasureUpdatePage({
    Key key,
    @required this.customerId,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MeasureUpdatePage();
  }
}

class _MeasureUpdatePage extends State<MeasureUpdatePage> {
  // 用于提交存储的值
  Measure _measure;
  MeasureViewModel _measureViewModel = MeasureViewModel();
  NumberOperationWidget _roomNumWidget;
  NumberOperationWidget _parlorNumWidget;
  NumberOperationWidget _kitchenNumWidget;
  NumberOperationWidget _toiletNumWidget;
  NumberOperationWidget _balconyNumWidget;
  FormItemTextFieldWidget _areaWidget;
  final _remarkTextController = new TextEditingController();
  ImageListWidget _imageListWidget;
  // 添加记录或更新记录标识
  bool _isAdd = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // 初始化数据
    if (MeasureStateSubject.instance.measure != null) {
      _isAdd = false;
      _measure = Measure.copyModel(MeasureStateSubject.instance.measure);
    } else {
      _measure = Measure.initData();
    }

    _roomNumWidget = NumberOperationWidget(
      numText: _measure.roomNum.toString(),
    );
    _parlorNumWidget = NumberOperationWidget(
      numText: _measure.parlorNum.toString(),
    );
    _kitchenNumWidget = NumberOperationWidget(
      numText: _measure.kitchenNum.toString(),
    );
    _toiletNumWidget = NumberOperationWidget(
      numText: _measure.toiletNum.toString(),
    );
    _balconyNumWidget = NumberOperationWidget(
      numText: _measure.balconyNum.toString(),
    );
    _areaWidget = FormItemTextFieldWidget(
      title: "房屋面积",
      text: (_measure.area != 0) ? _measure.area.toString() : "",
      hitText: "填写房屋面积",
      child: Text("m2"),
    );
    _remarkTextController.text = _measure.remark;
    _imageListWidget = ImageListWidget(
      remoteImages: _measure.images,
      hasCamera: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text((_isAdd) ? "添加量房记录" : "编辑量房记录"),
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
                          FormItemWidget(title: "卧室", child: _roomNumWidget),
                          Padding(
                            padding: EdgeInsets.only(left: 30.w),
                            child: Divider(
                              height: 2.h,
                            ),
                          ),
                          FormItemWidget(
                            title: "客厅",
                            child: _parlorNumWidget,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30.w),
                            child: Divider(
                              height: 2.h,
                            ),
                          ),
                          FormItemWidget(
                            title: "厨房",
                            child: _kitchenNumWidget,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30.w),
                            child: Divider(
                              height: 2.h,
                            ),
                          ),
                          FormItemWidget(
                            title: "卫生间",
                            child: _toiletNumWidget,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30.w),
                            child: Divider(
                              height: 2.h,
                            ),
                          ),
                          FormItemWidget(
                            title: "阳台",
                            child: _balconyNumWidget,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30.w),
                            child: Divider(
                              height: 2.h,
                            ),
                          ),
                          _areaWidget,
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
                                    _measure.lfTime =
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
                              title: "量房时间",
                              content: _measure.lfTime,
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
                              controller: this._remarkTextController,
                              keyboardType: TextInputType.multiline,
                              maxLines: 2,
                              maxLength: 100,
                              decoration: InputDecoration(
                                hintText: '填写量房信息',
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
                      return _measureViewModel.addMeasureInfo(_measure,
                          widget.customerId, _imageListWidget.addImageFiles);
                    } else {
                      return _measureViewModel.updateMeasureInfo(
                          _measure,
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

  wrapSubmitData() {
    _measure.roomNum = int.parse(_roomNumWidget.textController.text);
    _measure.parlorNum = int.parse(_parlorNumWidget.textController.text);
    _measure.kitchenNum = int.parse(_kitchenNumWidget.textController.text);
    _measure.toiletNum = int.parse(_toiletNumWidget.textController.text);
    _measure.balconyNum = int.parse(_balconyNumWidget.textController.text);
    _measure.area = _areaWidget.textController.text!="" ? int.parse(_areaWidget.textController.text) : 0;
    _measure.remark = _remarkTextController.text;
  }
}
