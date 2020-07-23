import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormButtonWidget extends StatelessWidget{
  final String title;
  final Function func;
  FormButtonWidget({Key key, @required this.title, this.func}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  FlatButton(
      onPressed: this.func,
      child: Container(
        width: double.infinity,
        height: 80.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          this.title,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 36.sp),
        ),
      ),
    );
  }

}