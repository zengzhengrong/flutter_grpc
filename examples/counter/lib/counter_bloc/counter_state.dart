import 'package:equatable/equatable.dart';

abstract class CounterState extends Equatable {
  const CounterState();
}

class InitialCounterState extends CounterState {
  @override
  List<Object> get props => [];
}

// Similar event class , we create two state class
// Another we should create failure state

class CounterLoading extends CounterState {
  @override
  List<Object> get props => null;
}

class IncrementCounterState extends CounterState {
  final int number;
  IncrementCounterState(this.number);

  @override
  List<Object> get props => [number];
}

class DecrementCounterState extends CounterState {
  final int number;
  DecrementCounterState(this.number);

  @override
  List<Object> get props => [number];
}

class CounterFailure extends CounterState {
  final String error;
  const CounterFailure({this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'CounterFailure { error: $error }';
}
