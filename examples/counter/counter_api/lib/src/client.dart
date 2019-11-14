import 'dart:async';
import 'package:grpc/grpc.dart';
import 'package:counter_api/counter_api.dart';

class CounterClientApi {
  ClientChannel channel;
  CounterClient stub;

  CounterClientApi() {
    channel = ClientChannel('localhost',port: 50051,
        options:
            const ChannelOptions(credentials: ChannelCredentials.insecure()));
    stub = CounterClient(channel);
  }

  Future<void> main(List<String> args) async {
    try {
      await getcounter(args);
    } catch (e) {
      print('main Caught error: $e');
    }
    await channel.shutdown();
  }

  Future<int> getcounter(List<Object> args,{CounterRequest_Operator type}) async {
    final number = args.isNotEmpty ? args[0] : '0';
    final breadth = args.isNotEmpty ? args[1] : '1';
    try {
      final request = CounterRequest()
        ..number = int.parse(number)
        ..breadth = int.parse(breadth)
        ..type = type ?? CounterRequest_Operator.Increment;
      final response = await this.stub.getCounter(request);
      print('Counter client received: ${response.number}');
      return response.number;
    } catch (e) {
      print('getcounter Caught error: $e');
      return 0;
    }
  }
}