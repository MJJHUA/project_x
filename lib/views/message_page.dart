import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MessageContentPage();
  }
}

class _MessageContentPage extends State<MessagePage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 200)),
          Center(
            child: Text("login successed."),
          ),
          Padding(padding: EdgeInsets.only(top: 30)),
        ],
      ),
    );
  }
}