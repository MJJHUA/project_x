import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectx/viewmodels/construction/construction_bloc.dart';

import 'construction_add_page.dart';

class ConstructionInfoPage extends StatelessWidget {
  final int customerId;
  ConstructionInfoPage({Key key, @required this.customerId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ConstructionBloc>(context)
        .add(ConstructionStarted(customerId: customerId));

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("施工"),
        centerTitle: true,
        actions: <Widget>[],
      ),
      body: Container(
        child: Center(
          child: BlocBuilder<ConstructionBloc, ConstructionState>(
            builder: (context, state) {
              if (state is ConstructionLoadInProcess) {
                return CircularProgressIndicator();
              }
              if (state is ConstructionLoadSuccess) {
                return Text(state.construction.address);
              }
              return Text('Something went wrong!');
            },
          ),

//        child: BlocListener<ConstructionBloc, ConstructionState>(
//          listener: (context, state) {
//            print("listen..............");
//            if (state is ConstructionLoadInProcess)
//                return CircularProgressIndicator();
//              if (state is ConstructionLoadSuccess)
//                return Text(state.construction.address);
//              return Text('Something went wrong!');
//          },
//        ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ConstructionAddPage(),
                ),
              );
            }),
      ),
    );
  }
}
