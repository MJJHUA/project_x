class CommonCustomer {
  int id;
  String name;
  String mobile;
  String sex;
  String address;
  int area;
  String roomType;
  String layoutType;
  String zxType;
  String businessType;
  String createTime;
  String channel;

  CommonCustomer(
      {
        this.id,
        this.name,
        this.mobile,
        this.sex,
        this.address,
        this.area,
        this.roomType,
        this.layoutType,
        this.zxType,
        this.businessType,
        this.createTime,
        this.channel
      });

  CommonCustomer.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json['name'];
    mobile = json['mobile'];
    sex = json['sex'];
    address = json['address'];
    area = json['area'];
    roomType = json['room_type'];
    layoutType = json['layout_type'];
    zxType = json['zx_type'];
    businessType = json['business_type'];
    createTime = json['create_time'];
    channel = json['channel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['sex'] = this.sex;
    data['address'] = this.address;
    data['area'] = this.area;
    data['room_type'] = this.roomType;
    data['layout_type'] = this.layoutType;
    data['zx_type'] = this.zxType;
    data['business_type'] = this.businessType;
    data["create_time"] = this.createTime;
    data["channel"] = this.channel;
    return data;
  }
}