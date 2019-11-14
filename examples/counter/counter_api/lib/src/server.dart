import 'dart:async';
import 'package:grpc/grpc.dart';
import 'package:counter_api/counter_api.dart';

class CounterService extends CounterServiceBase {
  @override
  Future<CounterResponse> getCounter(ServiceCall call, CounterRequest request) async {
    final String type = request.type.name;
    print(type);
    if (type == 'Increment'){
      int number = request.number + request.breadth;
      return CounterResponse()..number=number;
      
    }
    
    if (type == 'Decrement'){
      int number = request.number - request.breadth;
      return CounterResponse()..number=number;
      
    }
    return CounterResponse();
  }
  
}

Future<void> main(List<String> args) async {
  final server = Server([CounterService()]);
  await server.serve(port: 50051);
  print('Server listening on port ${server.port}...');
}