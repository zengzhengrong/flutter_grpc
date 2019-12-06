import 'dart:async';
import 'package:grpc/grpc.dart';
import 'package:posts_api/posts_api.dart';

class PostClientApi {
  ClientChannel channel;
  PostsClient stub;

  PostClientApi() {
    channel = ClientChannel('172.20.10.8',
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

  Future<PostsResponse> getposts(
      {String host, int port, int page, int perPage}) async {
    print('input args:host:$host,port:$port,page:$page,perPage:$perPage');
    try {
      final request = PostsRequest()
        ..host = host ?? '172.20.10.8'
        ..port = port ?? 8000
        ..page = page ?? 1
        ..perPage = perPage ?? 20;
      print(
          'request args:host:${request.host},port:${request.port},page:${request.page},perPage:${request.perPage}');
      final response = await stub.getPosts(request);
      await channel.shutdown();
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
