import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:projectx/base/http.dart';
import 'package:projectx/models/construction.dart';
import 'package:projectx/viewmodels/construction/construction_repository.dart';

part 'construction_event.dart';
part 'construction_state.dart';

class ConstructionBloc extends Bloc<ConstructionEvent, ConstructionState> {

  final ConstructionRepository constructionRepository = ConstructionRepository();

  ConstructionBloc() : super(ConstructionInitial());

  @override
  Stream<ConstructionState> mapEventToState(ConstructionEvent event) async* {

    if (event is ConstructionStarted) {
      yield* _mapConstructionStartedToState(event.customerId);
    }
    if (event is ConstructionUpdated) {
      yield* _mapConstructionUpdateToState(event.construction);
    }
  }

  Stream<ConstructionState> _mapConstructionStartedToState(int customerId) async* {
    try {
      yield ConstructionLoadInProcess();
      final info = await constructionRepository.getConstructionInfo(customerId);
      if(info["code"] == 200) {
        Construction construction;
        if (info["data"] == null)
          construction = null;
        else
          construction= Construction.fromJson(info["data"]);
        yield ConstructionLoadSuccess(construction: construction);
      }
      else {
        yield ConstructionLoadFailure(error: info["msg"]);
      }
    } catch (_) {
      yield ConstructionLoadFailure(error: "加载失败，请重试");
    }
  }

  Stream<ConstructionState> _mapConstructionUpdateToState(Construction construction) async* {
       yield ConstructionLoadSuccess(construction: construction);
  }

}