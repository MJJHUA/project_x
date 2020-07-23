part of 'construction_bloc.dart';

@immutable
abstract class ConstructionState extends Equatable {
  const ConstructionState();
}

class ConstructionInitial extends ConstructionState {
  @override
  List<Object> get props => [];
}

class ConstructionLoadInProcess extends ConstructionState {
  @override
  List<Object> get props => [];
}

class ConstructionLoadSuccess extends ConstructionState {
  final Construction construction;
  const ConstructionLoadSuccess({this.construction});

  @override
  List<Object> get props => [construction];
}

class ConstructionLoadFailure extends ConstructionState {
  final String error;
  const ConstructionLoadFailure({this.error});
  @override
  List<Object> get props => [error];
}