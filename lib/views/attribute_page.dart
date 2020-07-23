import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectx/models/attributes.dart';

class AttributePage extends StatefulWidget {
  final String title;
  final List<Attribute> attributeList;
  final Attribute attribute;
  AttributePage({Key key, this.title, this.attributeList, this.attribute}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AttributePage();
  }
}

class _AttributePage extends State<AttributePage> {
  Attribute _selected = Attribute(k: -1, v: "");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selected = Attribute(k: widget.attribute.k, v: widget.attribute.v);
  }

  void selectMode(int value) {
    widget.attributeList.forEach((element) {
      if (element.k == value) {
        _selected.k = element.k;
        _selected.v = element.v;
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20.h),
          ),
          Column(children: listWidget()),
          Padding(padding: EdgeInsets.only(top: 20.h)),
          FlatButton(
            onPressed: () {
              if (_selected.k != -1) {
                Navigator.pop(context, _selected);
              }
            },
            child: Container(
              width: double.infinity,
              height: 80.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                "确定",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 36.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> listWidget() {
    List<Widget> tiles = [];
    widget.attributeList.forEach((element) {
      tiles.add(Container(
        color: Colors.white,
        child: RadioListTile(
          value: element.k,
          title: Text(element.v),
          groupValue: _selected.k,
          onChanged: (value) {
            setState(() {
              selectMode(value);
            });
          },
          selected: _selected.k == element.k,
        ),
      ));
      tiles.add(Divider(
        height: 2.h,
      ));
    });
    return tiles;
  }
}
