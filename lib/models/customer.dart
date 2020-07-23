class Customer {
  CustomerInfo customerInfo;
  List<TeamInfo> teamInfo;
  List<MenuInfo> menuInfo;

  Customer({this.customerInfo, this.teamInfo, this.menuInfo});

  Customer.fromJson(Map<String, dynamic> json) {
    customerInfo = json['customer_info'] != null
        ? new CustomerInfo.fromJson(json['customer_info'])
        : null;
    if (json['team_info'] != null) {
      teamInfo = new List<TeamInfo>();
      json['team_info'].forEach((v) {
        teamInfo.add(new TeamInfo.fromJson(v));
      });
    }
    if (json['menu_info'] != null) {
      menuInfo = new List<MenuInfo>();
      json['menu_info'].forEach((v) {
        menuInfo.add(new MenuInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.customerInfo != null) {
      data['customer_info'] = this.customerInfo.toJson();
    }
    if (this.teamInfo != null) {
      data['team_info'] = this.teamInfo.map((v) => v.toJson()).toList();
    }
    if (this.menuInfo != null) {
      data['menu_info'] = this.menuInfo.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CustomerInfo {
  int id;
  String name;
  String mobile;
  CustomerMark customerMark;
  List<CustomerStage> customerStage;
  String sex;
  String address;
  int area;
  String roomType;
  String layoutType;
  String zxType;
  String businessType;
  String channel;
  String allotTime;

  CustomerInfo(
      {
        this.id,
        this.name,
        this.mobile,
        this.customerMark,
        this.customerStage,
        this.sex,
        this.address,
        this.area,
        this.roomType,
        this.layoutType,
        this.zxType,
        this.businessType,
        this.channel,
        this.allotTime
      });

  CustomerInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    customerMark = json['customer_mark'] != null
        ? new CustomerMark.fromJson(json['customer_mark'])
        : null;
    if (json['customer_stage'] != null) {
      customerStage = new List<CustomerStage>();
      json['customer_stage'].forEach((v) {
        customerStage.add(new CustomerStage.fromJson(v));
      });
    }
    sex = json['sex'];
    address = json['address'];
    area = json['area'];
    roomType = json['room_type'];
    layoutType = json['layout_type'];
    zxType = json['zx_type'];
    businessType = json['business_type'];
    channel = json['channel'];
    allotTime = json['allot_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    if (this.customerMark != null) {
      data['customer_mark'] = this.customerMark.toJson();
    }
    if (this.customerStage != null) {
      data['customer_stage'] =
          this.customerStage.map((v) => v.toJson()).toList();
    }
    data['sex'] = this.sex;
    data['address'] = this.address;
    data['area'] = this.area;
    data['room_type'] = this.roomType;
    data['layout_type'] = this.layoutType;
    data['zx_type'] = this.zxType;
    data['business_type'] = this.businessType;
    data['channel'] = this.channel;
    data['allot_time'] = this.allotTime;
    return data;
  }
}

class CustomerMark {
  int id;
  String value;
  String style;

  CustomerMark({this.id, this.value, this.style});

  CustomerMark.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    style = json['style'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['value'] = this.value;
    data['style'] = this.style;
    return data;
  }
}

class CustomerStage {
  int id;
  String value;
  String style;
  bool reach;

  CustomerStage({this.id, this.value, this.style, this.reach});

  CustomerStage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    style = json['style'];
    reach = json['reach'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['value'] = this.value;
    data['style'] = this.style;
    data['reach'] = this.reach;
    return data;
  }
}

class TeamInfo {
  int id;
  int userId;
  int sex;
  String realName;
  String rName;

  TeamInfo({this.id, this.userId, this.sex, this.realName, this.rName});

  TeamInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    sex = json['sex'];
    realName = json['real_name'];
    rName = json['r_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['sex'] = this.sex;
    data['real_name'] = this.realName;
    data['r_name'] = this.rName;
    return data;
  }
}

class MenuInfo {
  int id;
  String name;
  String icon;
  String style;
  String path;

  MenuInfo({this.id, this.name, this.icon, this.style, this.path});

  MenuInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    style = json['style'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['icon'] = this.icon;
    data['style'] = this.style;
    data['path'] = this.path;
    return data;
  }
}