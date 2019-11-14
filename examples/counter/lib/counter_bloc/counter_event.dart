import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();
}

// We should create custom Events Class to changge the counter state
//  increment, decrement  should be considered

class IncrementButtonPressed extends CounterEvent {
  final int number;
  IncrementButtonPressed(this.number);

  @override
  List<Object> get props => [number];
  @override
  String toString() => 'IncrementButtonPressed { number: $number }';
}

class DecrementButtonPressed extends CounterEvent {
  final int number;
  DecrementButtonPressed(this.number);

  @override
  List<Object> get props => [number];

  @override
  String toString() => 'DecrementButtonPressed { number: $number }';
}
