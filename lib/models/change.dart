class Change {
  int id;
  int type;
  int amount;
  String title;
  String content;
  int approved;
  List<String> images;

  Change(
      {this.id,
        this.type,
        this.amount,
        this.title,
        this.content,
        this.approved,
        this.images});

  Change.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    amount = json['amount'];
    title = json['title'];
    content = json['content'];
    approved = json['approved'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['amount'] = this.amount;
    data['title'] = this.title;
    data['content'] = this.content;
    data['approved'] = this.approved;
    data['images'] = this.images;
    return data;
  }
}