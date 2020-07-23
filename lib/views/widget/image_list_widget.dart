import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projectx/models/images.dart';
import 'image_wrap.dart';
import 'image_full_screen.dart';
import 'package:projectx/base/common.dart';

class ImageListWidget extends StatefulWidget {
  // remoteImagePaths, remoteImages 二者只能传其一
  // 网络图片路径数组
  final List<String> remoteImagePaths;
  // 网络图片对象数组（id, url）
  final List<Images> remoteImages;
  // 是否显示拍照功能
  final bool hasCamera;
  // 返回的新增本地图片文件数组
  final List<PickedFile> addImageFiles = List<PickedFile>();
  // 返回的删除网络图片id数组
  final List<int> delImageIds = List<int>();

  ImageListWidget({
    Key key,
    this.remoteImagePaths,
    this.remoteImages,
    this.hasCamera = false,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ImageListWidget();
  }
}

class _ImageListWidget extends State<ImageListWidget> {
  // 所有图片部件
  final List<Widget> _imageWidgetList = List();
  final ImagePicker _imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // 每次build， 清空所有图片部件
    _imageWidgetList.clear();

    if (!widget.hasCamera) {
      for (int i = 0; i < widget.remoteImagePaths.length; i++) {
        Widget w;
        w = GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FullScreenWrapper(
                  imageProvider: NetworkImage(widget.remoteImagePaths[i]),
                  filterQuality: FilterQuality.medium,
                ),
              ),
            );
          },
          child: ImageWrap(
            image: NetworkImage(widget.remoteImagePaths[i]),
          ),
        );
        _imageWidgetList.add(w);
      }
    } else {
      _imageWidgetList.add(camera(context));
      // 添加网络图片部件
      for (int i = 0; i < widget.remoteImages.length; i++) {
        Widget w = remoteImageWithFunc(context, widget.remoteImages[i]);
        _imageWidgetList.add(w);
      }

      // 添加本地图片部件
      if (widget.addImageFiles.length > 0) {
        widget.addImageFiles.forEach((element) {
          Widget w = localImageWithFunc(context, element);
          _imageWidgetList.add(w);
        });
      }
    }

    return Wrap(
      spacing: 30.w,
      runSpacing: 30.h,
      children: _imageWidgetList,
    );
  }

  // camera部件 弹出 样式一
  Widget camera(BuildContext context) {
    Map<String, Function> items = {
      "相册": () {
        getImageByGalleryOrCamera(context, ImageSource.gallery);
      },
      "拍照": () {
        getImageByGalleryOrCamera(context, ImageSource.camera);
      }
    };
    return GestureDetector(
      onTap: () {
        Common.popupSelectMenu(context, items);
//        showDialog(
//            context: context,
//            builder: (BuildContext context) {
//              return SimpleDialog(
//                children: <Widget>[
//                  SimpleDialogOption(
//                    child: Text('相册'),
//                    onPressed: () {
//                      Navigator.pop(context);
//                      getImageByGalleryOrCamera(context, ImageSource.gallery);
//                    },
//                  ),
//                  SimpleDialogOption(
//                    child: Text('拍照'),
//                    onPressed: () {
//                      Navigator.pop(context);
//                      getImageByGalleryOrCamera(context, ImageSource.camera);
//                    },
//                  ),
//                ],
//              );
//            });
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
    );
  }

  // camera部件 弹出 样式二（iOS 风格）
  Widget camera2(BuildContext context) {
    return GestureDetector(
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
    );
  }

  void showPhotoActionSheet({BuildContext context, Widget child}) {
    showCupertinoModalPopup<String>(
      context: context,
      builder: (BuildContext context) => child,
    ).then((String value) {
      if (value != null) {
        if (value == "Camera") {
          getImageByGalleryOrCamera(context, ImageSource.camera);
        } else if (value == "Gallery") {
          getImageByGalleryOrCamera(context, ImageSource.gallery);
        }
      }
    });
  }

  Future getImageByGalleryOrCamera(
      BuildContext context, ImageSource source) async {
    var image = await _imagePicker.getImage(source: source);
    if (image != null) {
      // 组件中添加本地图片
      setState(() {
        widget.addImageFiles.add(image);
      });
    }
  }

  // 生成带点击事件的网络图片部件
  Widget remoteImageWithFunc(BuildContext context, Images images) {
    Map<String, Function> items = {
      "预览": () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FullScreenWrapper(
              imageProvider: NetworkImage(images.url),
              filterQuality: FilterQuality.medium,
            ),
          ),
        );
      },
      "删除": () {
        setState(() {
          widget.remoteImages.remove(images);
          widget.delImageIds.add(images.id);
        });
      }
    };
    Widget w;
    w = GestureDetector(
      onTap: () {
        Common.popupSelectMenu(context, items);
      },
      child: ImageWrap(
        image: NetworkImage(images.url),
      ),
    );
    return w;
  }

  // 生成带点击事件的本地图片部件
  Widget localImageWithFunc(BuildContext context, PickedFile image) {
    Map<String, Function> items = {
      "预览": () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FullScreenWrapper(
              imageProvider: FileImage(File(image.path)),
              filterQuality: FilterQuality.medium,
            ),
          ),
        );
      },
      "删除": () {
        setState(() {
          // 组件中移除本地图片
          widget.addImageFiles.remove(image);
        });
      }
    };
    Widget w;
    w = GestureDetector(
      onTap: () {
        Common.popupSelectMenu(context, items);
      },
      child: ImageWrap(
        image: FileImage(File(image.path)),
      ),
    );
    return w;
  }
}
