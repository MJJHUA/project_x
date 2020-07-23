class AttributeSettings {
  List<Gender> gender;
  List<RoomType> roomType;
  List<LayoutType> layoutType;
  List<ZxType> zxType;
  List<BusinessType> businessType;
  List<Channel> channel;
  List<TrackMode> trackMode;

  AttributeSettings(
      {
        this.gender,
        this.roomType,
        this.layoutType,
        this.zxType,
        this.businessType,
        this.channel,
        this.trackMode,
      });

  AttributeSettings.fromJson(Map<String, dynamic> json) {
    if (json['gender'] != null) {
      gender = new List<Gender>();
      json['gender'].forEach((v) {
        gender.add(new Gender.fromJson(v));
      });
    }
    if (json['room_type'] != null) {
      roomType = new List<RoomType>();
      json['room_type'].forEach((v) {
        roomType.add(new RoomType.fromJson(v));
      });
    }
    if (json['layout_type'] != null) {
      layoutType = new List<LayoutType>();
      json['layout_type'].forEach((v) {
        layoutType.add(new LayoutType.fromJson(v));
      });
    }
    if (json['zx_type'] != null) {
      zxType = new List<ZxType>();
      json['zx_type'].forEach((v) {
        zxType.add(new ZxType.fromJson(v));
      });
    }
    if (json['business_type'] != null) {
      businessType = new List<BusinessType>();
      json['business_type'].forEach((v) {
        businessType.add(new BusinessType.fromJson(v));
      });
    }
    if (json['channel'] != null) {
      channel = new List<Channel>();
      json['channel'].forEach((v) {
        channel.add(new Channel.fromJson(v));
      });
    }
    if (json['track_mode'] != null) {
      trackMode = new List<TrackMode>();
      json['track_mode'].forEach((v) {
        trackMode.add(new TrackMode.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.gender != null) {
      data['gender'] = this.gender.map((v) => v.toJson()).toList();
    }
    if (this.roomType != null) {
      data['room_type'] = this.roomType.map((v) => v.toJson()).toList();
    }
    if (this.layoutType != null) {
      data['layout_type'] = this.layoutType.map((v) => v.toJson()).toList();
    }
    if (this.zxType != null) {
      data['zx_type'] = this.zxType.map((v) => v.toJson()).toList();
    }
    if (this.businessType != null) {
      data['business_type'] = this.businessType.map((v) => v.toJson()).toList();
    }
    if (this.channel != null) {
      data['channel'] = this.channel.map((v) => v.toJson()).toList();
    }
    if (this.trackMode != null) {
      data['track_mode'] = this.trackMode.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Gender {
  int k;
  String v;

  Gender({this.k, this.v});

  Gender.fromJson(Map<String, dynamic> json) {
    k = json['k'];
    v = json['v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['k'] = this.k;
    data['v'] = this.v;
    return data;
  }
}

class RoomType {
  int k;
  String v;

  RoomType({this.k, this.v});

  RoomType.fromJson(Map<String, dynamic> json) {
    k = json['k'];
    v = json['v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['k'] = this.k;
    data['v'] = this.v;
    return data;
  }
}

class LayoutType {
  int k;
  String v;

  LayoutType({this.k, this.v});

  LayoutType.fromJson(Map<String, dynamic> json) {
    k = json['k'];
    v = json['v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['k'] = this.k;
    data['v'] = this.v;
    return data;
  }
}

class ZxType {
  int k;
  String v;

  ZxType({this.k, this.v});

  ZxType.fromJson(Map<String, dynamic> json) {
    k = json['k'];
    v = json['v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['k'] = this.k;
    data['v'] = this.v;
    return data;
  }
}

class BusinessType {
  int k;
  String v;

  BusinessType({this.k, this.v});

  BusinessType.fromJson(Map<String, dynamic> json) {
    k = json['k'];
    v = json['v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['k'] = this.k;
    data['v'] = this.v;
    return data;
  }
}

class Channel {
  int k;
  String v;

  Channel({this.k, this.v});

  Channel.fromJson(Map<String, dynamic> json) {
    k = json['k'];
    v = json['v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['k'] = this.k;
    data['v'] = this.v;
    return data;
  }
}

class TrackMode {
  int k;
  String v;

  TrackMode({this.k, this.v});

  TrackMode.fromJson(Map<String, dynamic> json) {
    k = json['k'];
    v = json['v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['k'] = this.k;
    data['v'] = this.v;
    return data;
  }
}

class Attribute {
  int k;
  String v;

  Attribute({this.k, this.v});

  Attribute.fromJson(Map<String, dynamic> json) {
    k = json['k'];
    v = json['v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['k'] = this.k;
    data['v'] = this.v;
    return data;
  }
}
