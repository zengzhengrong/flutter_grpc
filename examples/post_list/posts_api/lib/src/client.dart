import 'dart:async';
import 'package:grpc/grpc.dart';
import 'package:posts_api/posts_api.dart';

class PostClientApi {
  ClientChannel channel;
  PostsClient stub;

  PostClientApi() {
    channel = ClientChannel('172.20.10.6',
        port: 50052,
        options:
            const ChannelOptions(credentials: ChannelCredentials.insecure()));
    stub = PostsClient(channel);
  }

  Future<void> main(List<String> args) async {
    try {
      await getposts();
    } catch (e) {
      print('main Caught error: $e');
    }
    await channel.shutdown();
  }

  Future<PostsResponse> getposts({String host, int port ,int page,int perPage}) async {
    // final host = host?? '172.20.10.6';
    // final port = args.isNotEmpty ? args[1] ?? 8000 : 8000;
    // final page = args.isNotEmpty ? args[2] ?? 1 : 1;
    // final perPage = args.isNotEmpty ? args[3] ?? 10 : 10;
    print('inpu args:host:$host,port:$port,page:$page,perPage:$perPage');
    try {
        final request = PostsRequest()
        ..host = host?? '172.20.10.6'
        ..port = port?? 8000
        ..page = page?? 1
        ..perPage = perPage?? 10;
      final response = await stub.getPosts(request);
      // print('Post client received: ${response.items}');
      return response;
    } catch (e) {
      print('getposts Caught error: $e');
      return PostsResponse();
    }
  }
}
main(List<String> args) async {
  await PostClientApi().main(args);
}
