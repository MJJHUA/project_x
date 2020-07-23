import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectx/models/customer.dart';

class ToggleButton<T> extends StatefulWidget {
  final T data;
  final List<int> selectedValues;

  ToggleButton(
    this.data, {
    Key key,
    this.selectedValues,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ToggleButton();
  }
}

class _ToggleButton extends State<ToggleButton> {
  bool _selected = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        setState(() {
          _selected = !_selected;
        });
        if (_selected) {
          widget.selectedValues.add(widget.data["id"]);
        } else {
          widget.selectedValues.remove(widget.data["id"]);
        }
      },
      child: Container(
        alignment: Alignment.center,
        width: 140.w,
        height: 60.h,
        decoration: BoxDecoration(
          color: _selected ? Colors.white : Colors.grey[100],
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: Colors.teal,
            style: _selected ? BorderStyle.solid : BorderStyle.none,
          ),
        ),
        child: Text(
          widget.data["value"],
          style: TextStyle(color: _selected ? Colors.teal : Colors.grey),
        ),
      ),
    );
  }
}
