import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:projectx/base/http.dart';
import 'package:projectx/models/attributes.dart';
import 'package:projectx/models/track.dart';

class TrackViewModel {

  TrackMode _selectedMode;

  TrackMode get selectedMode => _selectedMode;

  Future<TrackList> getTrackInfo(int customerId) async {
    Map<String, dynamic> params = {"customer_id": customerId};
    Response resp = await HttpClient.post("/app/track/list", params);
    var content = jsonDecode(resp.toString());
    TrackList list = TrackList.fromJson(content["data"]);
    return list;
  }
}