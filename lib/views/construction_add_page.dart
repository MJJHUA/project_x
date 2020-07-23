import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectx/models/construction.dart';
import 'package:projectx/viewmodels/construction/construction_bloc.dart';

class ConstructionAddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: RaisedButton(child: Text("add"), onPressed: (){
        Construction construction = Construction();
        construction.address = "嘉定区";
        BlocProvider.of<ConstructionBloc>(context)
            .add(ConstructionUpdated(construction: construction));
      },),
    );
  }
}