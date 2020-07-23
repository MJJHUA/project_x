class TrackList {
  List<Track> track;

  TrackList({this.track});

  TrackList.fromJson(Map<String, dynamic> json) {
    if (json['track'] != null) {
      track = new List<Track>();
      json['track'].forEach((v) {
        track.add(new Track.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.track != null) {
      data['track'] = this.track.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Track {
  int id;
  String createBy;
  String trackTime;
  String trackRemark;
  List<String> images;
  String nextTrackTime;

  Track(
      {this.id,
      this.createBy,
      this.trackTime,
      this.trackRemark,
      this.images,
      this.nextTrackTime});

  Track.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createBy = json['create_by'];
    trackTime = json['track_time'];
    trackRemark = json['track_remark'];
    images = json['images'].cast<String>();
    nextTrackTime = json['next_track_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['create_by'] = this.createBy;
    data['track_time'] = this.trackTime;
    data['track_remark'] = this.trackRemark;
    data['images'] = this.images;
    data['next_track_time'] = this.nextTrackTime;
    return data;
  }
}
