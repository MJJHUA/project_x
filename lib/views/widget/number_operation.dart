import 'package:flutter/material.dart';

class NumberOperationWidget extends StatelessWidget {
  //高度
  final double height;
  //输入框的宽度 总体宽度为自适应
  final double width;
  //按钮的宽度
  final double iconWidth;
  //默认输入框显示的数量
  final String numText;
  //点击加号回调 数量
  final ValueChanged addValueChanged;
  //点击减号回调 数量
  final ValueChanged removeValueChanged;
  //点击任意一个回调 数量
  final ValueChanged<int> updateValueChanged;

  final textController = new TextEditingController();

  NumberOperationWidget({
    this.height = 25,
    this.width = 40,
    this.iconWidth = 25,
    this.numText = "0",
    this.addValueChanged,
    this.removeValueChanged,
    this.updateValueChanged,
  });


  @override
  Widget build(BuildContext context) {

    this.textController.text = numText;

    return Row(
      children: <Widget>[
        Container(
          height: this.height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(width: 1, color: Colors.black12)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              //减号
              addAndSubtractIcon(icon: Icons.remove, isAdd: false),
              //输入框
              Container(
                width: this.width,
                decoration: BoxDecoration(
                    border: Border(
                        left: BorderSide(width: 1, color: Colors.black12),
                        right: BorderSide(width: 1, color: Colors.black12))),
                child: TextField(
                  controller: this.textController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
//                  style: TextStyle(fontSize: 12),
                  enableInteractiveSelection: false,
                  decoration: InputDecoration(
                    contentPadding:
                    EdgeInsets.only(left: 0, top: 2, bottom: 2, right: 0),
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
              //加号
              addAndSubtractIcon(icon: Icons.add, isAdd: true),
            ],
          ),
        )
      ],
    );
  }

  Widget addAndSubtractIcon({IconData icon, bool isAdd}) {
    return Container(
      width: this.iconWidth,
      child: IconButton(
        padding: EdgeInsets.all(0),
        icon: Icon(icon),
        onPressed: () {
          int num = int.parse(textController.text);
          if (!isAdd && num == 0) return;
          if (isAdd) {
            num++;
            if (this.addValueChanged != null) this.addValueChanged(num);
          } else {
            num--;
            if (this.removeValueChanged != null)
              this.removeValueChanged(num);
          }
          textController.text = '$num';
          if (this.updateValueChanged != null) this.updateValueChanged(num);
        },
      ),
    );
  }



}
