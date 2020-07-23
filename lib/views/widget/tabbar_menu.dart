import 'package:flutter/material.dart';
import 'package:projectx/base/application.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectx/models/customer.dart';

class TabBarMenuWidget extends StatelessWidget {
  final List<MenuInfo> menuInfoList;
  TabBarMenuWidget({Key key, @required this.menuInfoList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 20.h),
      child: Wrap(
        children: generateMenuWidget(context),
      ),
    );
  }

  List<Widget> generateMenuWidget(BuildContext context) {

    List<Widget> menus = List();
    menuInfoList.forEach((item) {
      var menuItem = MyIconButton(
        onPressed: () {
          Application.router.navigateTo(context, item.path);
        },
        icon: IconData(
          int.parse(item.icon),
          fontFamily: 'MyIcons',
          matchTextDirection: true,
        ),
        title: item.name,
        bgWidth: 186.w,
        bgHeight: 140.h,
        iconColor: Color(int.parse(item.style)),
        titlePadding: 19.h,
      );
      menus.add(menuItem);
    });
    return menus;
  }
}

class MyIconButton extends StatelessWidget {
  final Function onPressed;
  final IconData icon;
  final Color iconColor;
  final String title;
  final Color titleColor;
  final double titlePadding;
  final double bgWidth;
  final double bgHeight;
  final Color bgColor;

  const MyIconButton({
    @required this.onPressed,
    @required this.icon,
    @required this.title,
    @required this.bgWidth,
    @required this.bgHeight,
    this.iconColor = Colors.black,
    this.titleColor = Colors.black,
    this.titlePadding = 0,
    this.bgColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: this.onPressed,
      child: Container(
        width: this.bgWidth,
        height: this.bgHeight,
        color: this.bgColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(this.icon, color: this.iconColor),
            Padding(padding: EdgeInsets.only(top: this.titlePadding)),
            Text(
              this.title,
              style: TextStyle(color: this.titleColor, fontSize: 20.sp),
            ),
          ],
        ),
      ),
    );
  }
}
