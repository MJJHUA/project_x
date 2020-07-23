import 'images.dart';

class Design {
  int id;
  String name;
  int styleId;
  String style;
  String designBy;
  String designTime;
  int approved;
  String remark;
  List<Images> images;

  Design(
      {this.id,
        this.name,
        this.styleId,
        this.style,
        this.designBy,
        this.designTime,
        this.approved,
        this.remark,
        this.images});

  Design.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    styleId = json['style_id'];
    style = json['style'];
    designBy = json['design_by'];
    designTime = json['design_time'];
    approved = json['approved'];
    remark = json['remark'];
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
    data['name'] = this.name;
    data['style_id'] = this.styleId;
    data['style'] = this.style;
    data['design_by'] = this.designBy;
    data['design_time'] = this.designTime;
    data['approved'] = this.approved;
    data['remark'] = this.remark;
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    return data;
  }

  Design.copyModel(Design model) {
    id = model.id;
    name = model.name;
    styleId = model.styleId;
    style = model.style;
    designBy = model.designBy;
    designTime = model.designTime;
    approved = model.approved;
    remark = model.remark;
    images = List<Images>();
    model.images.forEach((element) {
      images.add(Images(
        id: element.id,
        url: element.url,
      ));
    });
  }

  Design.initData() {
    id = 0;
    name = "";
    styleId = 0;
    style = "";
    designBy = "";
    designTime = "";
    approved = 0;
    remark = "";
    images = List<Images>();
  }
}