import 'package:flutter/material.dart';
import 'package:projectx/base/application.dart';
import 'package:projectx/models/track.dart';
import 'package:projectx/viewmodels/track_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectx/base/routes.dart';
import 'widget/image_list_widget.dart';

class TrackInfoPage extends StatefulWidget {
  final int customerId;

  TrackInfoPage({Key key, @required this.customerId}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TrackInfoPage();
  }
}

class _TrackInfoPage extends State<TrackInfoPage> {
  final TrackViewModel _trackController = TrackViewModel();
  var _trackInfoFuture;

  @override
  void initState() {
    // TODO: implement initState
    _trackInfoFuture = _trackController.getTrackInfo(widget.customerId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("跟进记录"),
        centerTitle: true,
      ),
      body: FutureBuilder<TrackList>(
        future: _trackInfoFuture,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text("none");
            case ConnectionState.active:
              return Text("active");
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Text("error");
              }
              if (snapshot.data.track.length == 0) {
                return Center(
                  child: Text(
                    "暂无跟进记录",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFCCCCCC),
                      fontSize: 36.sp,
                    ),
                  ),
                );
              }
              return ListView.builder(
                itemCount: snapshot.data.track.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(top: 30.h, left: 30.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.person_pin,
                              color: Colors.teal,
                            ),
                            Padding(padding: EdgeInsets.only(left: 10.w)),
                            Text(snapshot.data.track[index].createBy),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(right: 30.w),
                                child: Text(
                                  snapshot.data.track[index].trackTime,
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.h, left: 60.w),
                          child: Text(snapshot.data.track[index].trackRemark),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 30.h, left: 60.w, right: 60.w),
                          child: ImageListWidget(
                              remoteImagePaths: snapshot.data.track[index].images),
                        ),
                        Divider(
                          height: 2.h,
                        ),
                      ],
                    ),
                  );
                },
              );
          }
          return null;
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Application.router.navigateTo(context, Routes.trackAdd);
        },
        child: Icon(Icons.add),
      ),
    );
  }

}
