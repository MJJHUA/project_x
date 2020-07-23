import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:projectx/views/construction_info_page.dart';

import 'package:projectx/views/launch_page.dart';
import 'package:projectx/views/login_page.dart';
import 'package:projectx/views/message_page.dart';
import 'package:projectx/views/menu_page.dart';
import 'package:projectx/views/contact_page.dart';
import 'package:projectx/views/mine_page.dart';

import 'package:projectx/views/customer_list_page.dart';
import 'package:projectx/views/customer_info_page.dart';
import 'package:projectx/views/customer_add_page.dart';
import 'package:projectx/views/common_customer_list_page.dart';
import 'package:projectx/views/common_customer_info_page.dart';
import 'package:projectx/views/track_info_page.dart';
import 'package:projectx/views/track_add_page.dart';

import 'package:projectx/views/measure_info_page.dart';
import 'package:projectx/views/measure_update_page.dart';
import 'package:projectx/views/design_list_page.dart';
import 'package:projectx/views/design_info_page.dart';
import 'package:projectx/views/design_update_page.dart';

var launchHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) =>
        LaunchPage());

var loginHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) =>
        LoginPage());

var messageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) =>
        MessagePage());

var menuHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) =>
        MenuPage());

var contactHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) =>
        ContactPage());

var mineHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) =>
        MinePage());

var customerListHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) =>
        CustomerListPage());

var customerInfoHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  int customerId = int.parse(parameters["id"]?.first);
  return CustomerInfoPage(
    customerId: customerId,
  );
});

var customerAddHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) =>
        CustomerUpdatePage());

var commonCustomerListHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) =>
        CommonCustomerListPage());

var commonCustomerInfoHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  int id = int.parse(parameters["id"]?.first);
  return CommonCustomerInfoPage(
    customerId: id,
  );
});

var trackInfoHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
//      int customerId = int.parse(parameters["customer_id"]?.first);
  int id = 1;
  return TrackInfoPage(
    customerId: id,
  );
});

var trackAddHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) =>
        TrackAddPage());

var measureInfoHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) =>
        MeasureInfoPage(
          customerId: 1,
        ));

var measureUpdateHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  int customerId = int.parse(parameters["id"]?.first);
  return MeasureUpdatePage(
    customerId: customerId,
  );
});

var designListHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
//      int customerId = int.parse(parameters["customer_id"]?.first);
      int customerId = 1;
      return DesignListPage(customerId: customerId,);
    }
);

var designInfoHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
      int customerId = int.parse(parameters["customer_id"]?.first);
      return DesignInfoPage(customerId: customerId,);
    }
);

var designUpdateHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
      int customerId = int.parse(parameters["customer_id"]?.first);
      return DesignUpdatePage(customerId: customerId,);
    }
);

var constructionInfoHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
//      int customerId = int.parse(parameters["customer_id"]?.first);
      int customerId = 1;
      return ConstructionInfoPage(customerId: customerId,);
    }
);
