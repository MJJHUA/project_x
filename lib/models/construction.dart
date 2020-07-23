class Construction {
  int id;
  String address;
  String plannedStartTime;
  String plannedEndTime;
  String actualStartTime;
  String actualEndTime;
  int period;
  int completionDays;
  int approved;
  List<ConstructionItem> constructionItem;

  Construction(
      {this.id,
        this.address,
        this.plannedStartTime,
        this.plannedEndTime,
        this.actualStartTime,
        this.actualEndTime,
        this.period,
        this.completionDays,
        this.approved,
        this.constructionItem});

  Construction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
    plannedStartTime = json['planned_starttime'];
    plannedEndTime = json['planned_endtime'];
    actualStartTime = json['actual_starttime'];
    actualEndTime = json['actual_endtime'];
    period = json['period'];
    completionDays = json['completion_days'];
    approved = json['approved'];
    if (json['item'] != null) {
      constructionItem = new List<ConstructionItem>();
      json['item'].forEach((v) {
        constructionItem.add(new ConstructionItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['address'] = this.address;
    data['planned_starttime'] = this.plannedStartTime;
    data['planned_endtime'] = this.plannedEndTime;
    data['actual_starttime'] = this.actualStartTime;
    data['actual_endtime'] = this.actualEndTime;
    data['period'] = this.period;
    data['completion_days'] = this.completionDays;
    data['approved'] = this.approved;
    if (this.constructionItem != null) {
      data['item'] = this.constructionItem.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ConstructionItem {
  int id;
  String name;
  int itemStatus;
  int sort;
  int plannedPeriod;
  String plannedStartTime;
  String plannedEndTime;
  int actualPeriod;
  String actualStartTime;
  String actualEndTime;

  ConstructionItem(
      {this.id,
        this.name,
        this.itemStatus,
        this.sort,
        this.plannedPeriod,
        this.plannedStartTime,
        this.plannedEndTime,
        this.actualPeriod,
        this.actualStartTime,
        this.actualEndTime});

  ConstructionItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    itemStatus = json['item_status'];
    sort = json['sort'];
    plannedPeriod = json['planned_period'];
    plannedStartTime = json['planned_starttime'];
    plannedEndTime = json['planned_endtime'];
    actualPeriod = json['actual_period'];
    actualStartTime = json['actual_starttime'];
    actualEndTime = json['actual_endtime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['item_status'] = this.itemStatus;
    data['sort'] = this.sort;
    data['planned_period'] = this.plannedPeriod;
    data['planned_starttime'] = this.plannedStartTime;
    data['planned_endtime'] = this.plannedEndTime;
    data['actual_period'] = this.actualPeriod;
    data['actual_starttime'] = this.actualStartTime;
    data['actual_endtime'] = this.actualEndTime;
    return data;
  }
}