import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormItemWidget extends StatefulWidget {
  final String title;
  final String content;
  final Widget child;
  final Function func;

  FormItemWidget(
      {Key key, @required this.title, this.content, this.child, this.func})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FormItemWidget();
  }
}

class _FormItemWidget extends State<FormItemWidget> {
  @override
  Widget build(BuildContext context) {
    String textContent = widget.content ?? "";
    // TODO: implement build

    if (widget.func == null)
      return Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.only(top: 20.h, bottom: 20.h, left: 30.w),
                    child: Text(
                      widget.title,
                      style: TextStyle(color: Color(0xFF666666)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 39.w),
                    child: Text(
                      textContent,
                      style: TextStyle(color: Color(0xFF333333)),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 35.w),
              child: Align(
                alignment: Alignment.centerRight,
                child: widget.child,
              ),
            ),
          ],
        ),
      );
    else
      return GestureDetector(
        onTap: widget.func,
        child: Container(
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20.h, bottom: 20.h, left: 30.w),
                child: Text(
                  widget.title,
                  style: TextStyle(color: Color(0xFF666666)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 39.w),
                child: Text(
                  textContent,
                  style: TextStyle(color: Color(0xFF333333)),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 35.w),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: widget.child,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}

class FormItemTextFieldWidget extends StatefulWidget {
  final String title;
  final String text;
  final String hitText;
  final Widget child;

  final textController = new TextEditingController();

  FormItemTextFieldWidget({
    Key key,
    @required this.title,
    this.text,
    this.hitText,
    this.child,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FormItemTextFieldWidget();
  }
}

class _FormItemTextFieldWidget extends State<FormItemTextFieldWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.textController.text = widget.text;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20.h, bottom: 20.h, left: 30.w),
                  child: Text(
                    widget.title,
                    style: TextStyle(color: Color(0xFF666666)),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 39.w),
                    child: TextField(
                      controller: widget.textController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.left,
//                      style: TextStyle(fontSize: 12),
                      enableInteractiveSelection: false,
                      decoration: InputDecoration(
                        hintText: widget.hitText,
                        hintStyle: TextStyle(
                            fontSize: 28.sp,
                            color: Color(0xFFCCCCCC)),
                        contentPadding: EdgeInsets.only(
                            left: 0, top: 2, bottom: 2, right: 0),
                        border: const OutlineInputBorder(
                          gapPadding: 0,
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 35.w),
            child: Align(
              alignment: Alignment.centerRight,
              child: widget.child,
            ),
          ),
        ],
      ),
    );
  }
}
