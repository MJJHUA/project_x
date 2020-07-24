import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectx/base/routes.dart';
import 'package:projectx/models/construction.dart';
import 'package:projectx/viewmodels/construction/construction_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectx/base/application.dart';

import 'construction_add_page.dart';

class ConstructionInfoPage extends StatelessWidget {
  final int customerId;
  ConstructionInfoPage({Key key, @required this.customerId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ConstructionBloc>(context)
        .add(ConstructionStarted(customerId: customerId));

     return BlocBuilder<ConstructionBloc, ConstructionState>(
        builder: (context, state) {
          if (state is ConstructionLoadInProcess) {
            return Container(
              color: Colors.grey[200],
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is ConstructionLoadSuccess) {
            if (state.construction == null)
              return noDataWidget();
            else
              return noDataWidget();
          }
          return Text('Something went wrong!');
        },
    );


  }

  // 没有数据的页面展示
  Widget noDataWidget() {
    return Scaffold(
      appBar: AppBar(
        title: Text("施工"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text(
                "暂无施工计划",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFCCCCCC),
                  fontSize: 36.sp,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
//          Application.router.navigateTo(context,
//              Routes.measureUpdate + "?id=${customerId.toString()}");
//          Navigator.push(
//            context,
//            MaterialPageRoute(
//              builder: (context) => ConstructionAddPage(),
//            ),
//          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  // 有数据的页面展示
  Widget hasDataWidget(Construction construction) {

  }
}
