part of 'construction_bloc.dart';

@immutable
abstract class ConstructionEvent extends Equatable {
  const ConstructionEvent();
}

class ConstructionStarted extends ConstructionEvent {
  final int customerId;
  const ConstructionStarted({@required this.customerId});

  @override
  List<Object> get props => [customerId];
}

class ConstructionAdded extends ConstructionEvent {
  final Construction construction;
  const ConstructionAdded({@required this.construction});

  @override
  List<Object> get props => [construction];
}

class ConstructionUpdated extends ConstructionEvent {
  final Construction construction;
  const ConstructionUpdated({@required this.construction});

  @override
  List<Object> get props => [construction];
}