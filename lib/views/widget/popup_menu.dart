import 'package:flutter/material.dart';

class PopupMenu extends StatelessWidget {

  final Map<int, MenuItem> items;

  PopupMenu(
    this.items, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PopupMenuButton(
      icon: Icon(Icons.more_horiz),
      itemBuilder: (BuildContext context) {
        List<PopupMenuItem<int>> menu = new List();
        items.forEach((k, v) {
          menu.add(PopupMenuItem<int>(child: Text(v.title), value: k));
        });
        return menu;
      },
      onSelected: (int value) {
        items[value].callback();
      },
      onCanceled: () {
//        print("onCanceled");
      },
    );
  }
}

class MenuItem {
  String title;
  Function callback;

  MenuItem(this.title, this.callback);
}
