import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'counter_bloc/bloc.dart';
import 'common/loading_widget.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}

void main() {
   // Debug mode
  BlocSupervisor.delegate = SimpleBlocDelegate();
  return runApp(MyApp());
  }


class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter & gRPC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<CounterBloc>(
          builder: (context) => CounterBloc(),
          child: MyHomePage(title: 'Flutter Demo Home Page')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // TO display _counter by different State
  String stateCounter(CounterState state) {
    if (state is IncrementCounterState) {
      _counter = state.number;
      return '$_counter';
    }
    if (state is DecrementCounterState) {
      _counter = state.number;
      return '$_counter';
    }
    return '$_counter';
  }

  Widget dispaly(state) {
    if (state is CounterLoading) {
      return LoadingWidget();
    }
    return Text(
      stateCounter(state),
      style: Theme.of(context).textTheme.display1,
    );
  }

  @override
  Widget build(BuildContext context) {
    final CounterBloc counterbloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: BlocListener<CounterBloc, CounterState>(
        listener: (context, state) {
          if (state is CounterFailure) {
            Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('${state.error}'), backgroundColor: Colors.red));
          }
        },
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  dispaly(state),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () => counterbloc.add(DecrementButtonPressed(_counter)),
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: () => counterbloc.add(IncrementButtonPressed(_counter)),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
