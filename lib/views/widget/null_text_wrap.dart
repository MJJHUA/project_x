import 'package:flutter/material.dart';

class NullTextWrap extends StatelessWidget {
  final String text;
  NullTextWrap({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(this.text == null || this.text.isEmpty)
      return Text("暂无",style: TextStyle(color: Color(0xFF999999)),);
    return Text(this.text,style: TextStyle(color: Color(0xFF333333)),);
  }

}