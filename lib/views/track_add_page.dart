import 'package:flutter/material.dart';
import 'package:projectx/base/my_icons.dart';
import 'package:projectx/models/attributes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:projectx/views/attribute_page.dart';
import 'package:projectx/views/widget/form_item_widget.dart';
import 'package:projectx/base/common.dart';
import 'widget/form_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class TrackAddPage extends StatefulWidget {
  final int customerId;

  TrackAddPage({Key key, @required this.customerId}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TrackAddPage();
  }
}

class _TrackAddPage extends State<TrackAddPage> {
  Attribute _selectedMode = Attribute(k: -1, v: "");
  String trackTime = "";
  String nextTrackTime = "";

  ImagePicker imagePicker = ImagePicker();
  PickedFile _image;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text("添加跟进记录"),
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
            padding: EdgeInsets.only(),
            child: Column(
              children: <Widget>[
                FormItemWidget(
                  title: "跟进方式",
                  content: _selectedMode.v,
                  child: Icon(MyIcons.tongyongjinruxuanze),
                  func: toTrackModePage,
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
                          trackTime = Common.formatDateTime(date);
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
                    title: "跟进时间",
                    content: trackTime,
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
                  height: 210.h,
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 3,
                    maxLength: 100,
                    decoration: InputDecoration(
                      hintText: '填写跟进内容',
                      hintStyle:
                          TextStyle(fontSize: 28.sp, color: Color(0xFFCCCCCC)),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 20.h, horizontal: 30.w),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 20.h)),
          Container(
            padding: EdgeInsets.only(left: 30.w),
            color: Colors.white,
            height: 210.h,
            child: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    showPhotoActionSheet(
                      context: context,
                      child: CupertinoActionSheet(
                        actions: <Widget>[
                          CupertinoActionSheetAction(
                            child: const Text('相册'),
                            onPressed: () {
                              Navigator.pop(context, 'Gallery');
                            },
                          ),
                          CupertinoActionSheetAction(
                            child: const Text('拍照'),
                            onPressed: () {
                              Navigator.pop(context, 'Camera');
                            },
                          ),

//                            RadioListTile(
//                              value: 0,
//                              title: Text("weixin"),
//                              secondary: Icon(MyIcons.wechat),
//                              groupValue: 1,
//                              onChanged: (value) {},
//                            ),
                        ],
                        cancelButton: CupertinoActionSheetAction(
                          child: const Text('取消'),
                          isDefaultAction: true,
                          onPressed: () {
                            Navigator.pop(context, 'Cancel');
                          },
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(width: 1, color: Colors.black12),
                    ),
                    width: 150.w,
                    height: 150.h,
                    child: Icon(
                      Icons.photo_camera,
                      size: 50,
                      color: Color(0xFFCCCCCC),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 20.h)),
          GestureDetector(
            onTap: () {
              DatePicker.showDateTimePicker(
                context,
                showTitleActions: true,
                onChanged: (date) {},
                onConfirm: (date) {
                  setState(() {
                    nextTrackTime = Common.formatDateTime(date);
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
              title: "下次跟进时间",
              content: nextTrackTime,
              child: Icon(MyIcons.tongyongjinruxuanze),
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
//      }),
//    );
  }

  void showPhotoActionSheet({BuildContext context, Widget child}) {
    showCupertinoModalPopup<String>(
      context: context,
      builder: (BuildContext context) => child,
    ).then((String value) {
      if (value != null) {
        if (value == "Camera") {
          getImageByCamera();
        } else if (value == "Gallery") {
          getImageByGallery();
        }
      }
    });
  }

  Future getImageByCamera() async {
    var image = await imagePicker.getImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  Future getImageByGallery() async {
    var image = await imagePicker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  void toTrackModePage() {
    List<Attribute> attributeList = List<Attribute>();
    attributeList.add(Attribute(k: 0, v: "微信/QQ"));
    attributeList.add(Attribute(k: 1, v: "电话"));
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AttributePage(
            title: "跟进方式",
            attributeList: attributeList,
            attribute: _selectedMode,
          )),
    ).then((result) {
      setState(() {
        if (result != null) {
          _selectedMode.k = result.k;
          _selectedMode.v = result.v;
        }
      });
    });
  }
}
