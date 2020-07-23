import 'package:fluro/fluro.dart';
import 'package:projectx/base/route_handlers.dart';

class Routes {
  static const String root = "/";
  static const String login = "/login";
  static const String message = "/message";
  static const String menu = "/menu";
  static const String contact = "/contact";
  static const String mine = "/mine";

  //我的客户列表
  static const String customerList = "/customer/list";
  //客户详情
  static const String customerInfo = "/customer/info";
  static const String customerAdd = "/customer/add";
  static const String customerGender = "/customer/gender";
  static const String customerRoomType = "/customer/roomtype";
  static const String customerLayoutType = "/customer/layouttype";
  static const String customerZxType = "/customer/zxtype";
  static const String customerBusinessType = "/customer/businesstype";
  static const String customerChannel = "/customer/channel";
  //公海客户列表
  static const String commonCustomerList = "/common_customer/list";
  //公海客户详情
  static const String commonCustomerInfo = "/common_customer/info";
  //跟进记录列表
  static const String trackInfo = "/track/list";
  //添加跟进记录
  static const String trackAdd = "/track/add";
  //跟进记录-跟进方式选择
  static const String trackMode = "/track/mode";
  //量房信息
  static const String measureInfo = "/measure/info";
  //添加更新量房信息
  static const String measureUpdate = "/measure/update";
  //设计方案列表
  static const String designList = "/design/list";
  //设计方案详情
  static const String designInfo = "/design/info";
  //添加更新设计方案
  static const String designUpdate = "/design/update";
  //设计施工详情
  static const String constructionInfo = "/construction/info";

  static void configureRoutes(Router router) {
    router.define(root, handler: launchHandler);
    router.define(login, handler: loginHandler);
    router.define(message, handler: messageHandler);
    router.define(menu, handler: menuHandler);
    router.define(contact, handler: contactHandler);
    router.define(mine, handler: mineHandler);

    router.define(customerList, handler: customerListHandler);
    router.define(customerInfo + "/:id", handler: customerInfoHandler);
    router.define(customerAdd, handler: customerAddHandler);
    router.define(commonCustomerList, handler: commonCustomerListHandler);
    router.define(commonCustomerInfo + "/:id",
        handler: commonCustomerInfoHandler);
    router.define(trackInfo, handler: trackInfoHandler);
    router.define(trackAdd, handler: trackAddHandler);
    router.define(measureInfo, handler: measureInfoHandler);
    router.define(measureUpdate, handler: measureUpdateHandler);
    router.define(designList, handler: designListHandler);
    router.define(designInfo, handler: designInfoHandler);
    router.define(designUpdate, handler: designUpdateHandler);

    router.define(constructionInfo, handler: constructionInfoHandler);
  }
}
