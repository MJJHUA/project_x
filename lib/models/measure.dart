import 'images.dart';

class Measure {
  int id;
  int roomNum;
  int parlorNum;
  int kitchenNum;
  int toiletNum;
  int balconyNum;
  int area;
  String lfTime;
  String measureBy;
  String remark;
  int approved;
  List<Images> images;

  Measure(
      {this.id,
      this.roomNum,
      this.parlorNum,
      this.kitchenNum,
      this.toiletNum,
      this.balconyNum,
      this.area,
      this.lfTime,
      this.measureBy,
      this.remark,
      this.approved,
      this.images});

  Measure.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roomNum = json['room_num'];
    parlorNum = json['parlor_num'];
    kitchenNum = json['kitchen_num'];
    toiletNum = json['toilet_num'];
    balconyNum = json['balcony_num'];
    area = json['area'];
    lfTime = json['lf_time'];
    measureBy = json['measure_by'];
    remark = json['remark'];
    approved = json['approved'];
    if (json['images'] != null) {
      images = new List<Images>();
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['room_num'] = this.roomNum;
    data['parlor_num'] = this.parlorNum;
    data['kitchen_num'] = this.kitchenNum;
    data['toilet_num'] = this.toiletNum;
    data['balcony_num'] = this.balconyNum;
    data['area'] = this.area;
    data['lf_time'] = this.lfTime;
    data['measure_by'] = this.measureBy;
    data['remark'] = this.remark;
    data['approved'] = this.approved;
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    return data;
  }

  Measure.copyModel(Measure model) {
    id = model.id;
    roomNum = model.roomNum;
    parlorNum = model.parlorNum;
    kitchenNum = model.kitchenNum;
    toiletNum = model.toiletNum;
    balconyNum = model.balconyNum;
    area = model.area;
    lfTime = model.lfTime;
    measureBy = model.measureBy;
    remark = model.remark;
    approved = model.approved;
    images = List<Images>();
    model.images.forEach((element) {
      images.add(Images(
        id: element.id,
        url: element.url,
      ));
    });
  }

  Measure.initData() {
    id = 0;
    roomNum = 0;
    parlorNum = 0;
    kitchenNum = 0;
    toiletNum = 0;
    balconyNum = 0;
    area = 0;
    lfTime = "";
    measureBy = "";
    remark = "";
    approved = 0;
    images = List<Images>();
  }
}
