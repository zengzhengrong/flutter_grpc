import 'dart:async';
import 'package:grpc/grpc.dart';
import 'package:posts_api/posts_api.dart';

main(List<String> args) async {
  final ClientChannel channel = ClientChannel('localhost',
      port: 50052,
      options:
          const ChannelOptions(credentials: ChannelCredentials.insecure()));
  final PostsClient stub = PostsClient(channel);
  final request = PostsRequest()
  ..host = '192.168.1.235'
  ..port = 8000
  ..page = 1
  ..perPage = 10;
  
  final response = await stub.getPosts(request);
  print('Counter client received: ${response}');
}
