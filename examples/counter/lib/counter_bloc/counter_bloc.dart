import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';
import 'package:counter_api/counter_api.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  @override
  CounterState get initialState => InitialCounterState();

  @override
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {
    if (event is IncrementButtonPressed) {
      try {
        yield CounterLoading();
        final counter = await CounterClientApi().getcounter([event.number.toString(),'1'],type:CounterRequest_Operator.Increment);
        // final counter = event.number + 1;
        yield IncrementCounterState(counter);
      } catch (e) {
        yield CounterFailure(error: e.toString());
      }
    }
    if (event is DecrementButtonPressed) {
      try {
        yield CounterLoading();
        final counter = await CounterClientApi().getcounter([event.number.toString(),'1'],type:CounterRequest_Operator.Decrement);
        // final counter = event.number - 1;
        yield DecrementCounterState(counter);
      } catch (e) {
        yield CounterFailure(error: e.toString());
      }
    }
  }
}
