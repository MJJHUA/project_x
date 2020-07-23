import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Common {
  static String formatDateTime(DateTime date) {
    return "${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}";
  }

  static netWorkLoading({@required Function callback, Function onSuccess}) {
    BotToast.showLoading();

    callback().then((value) {
      BotToast.closeAllLoading();
      BotToast.showText(
        text: value["msg"],
        duration: Duration(seconds: 1),
      );
      if (value["code"] == 200) {
        if (onSuccess != null) onSuccess();
      }
    });
  }

  static Future imageToBase64AndCompress(PickedFile file) async {
    List<int> imageBytes =
        await FlutterImageCompress.compressWithFile(file.path, quality: 20);
    print('压缩图片大小:' + imageBytes.length.toString());
    return base64Encode(imageBytes);
  }

  static popupSelectMenu(BuildContext context, Map<String, Function> items) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          List<Widget> itemWidgets = List<Widget>();
          items.forEach((key, value) {
            itemWidgets.add(
              SimpleDialogOption(
                child: Text(key),
                onPressed: () {
                  Navigator.pop(context);
                  value();
                },
              ),
            );
          });
          return SimpleDialog(
            children: itemWidgets,
          );
        });
  }

  static popupBottomMenu(BuildContext context, Map<String, Function> items) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          List<Widget> itemWidgets = List<Widget>();
          items.forEach((key, value) {
            itemWidgets.add(
              ListTile(
                title:
                Center(child:
                Text(key),
                ),
                onTap: () async {
                  Navigator.pop(context);
                  value();
                },
              ),
            );
          });
          return new Column(
            mainAxisSize: MainAxisSize.min,
            children: itemWidgets,
          );
        });
  }
}
