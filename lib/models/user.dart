class User {
  String userToken;
  String apiDomain;
  int userId;

  User({this.userToken, this.apiDomain, this.userId});

  User.fromJson(Map<String, dynamic> json) {
    userToken = json['user_token'];
    apiDomain = json['api_domain'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_token'] = this.userToken;
    data['api_domain'] = this.apiDomain;
    data['user_id'] = this.userId;
    return data;
  }
}