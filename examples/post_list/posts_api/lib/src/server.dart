import 'dart:async';
import 'package:grpc/grpc.dart';
import 'package:posts_api/posts_api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;

class PostsService extends PostsServiceBase {
  @override
  Future<PostsResponse> getPosts(ServiceCall call, PostsRequest request) async {
    final String apiUrl =
        'http://${request.host}:${request.port}/post/?page=${request.page}&per_page=${request.perPage}';
    print('request:$apiUrl');
    var apiresponse = await http.get(apiUrl);
    print(apiresponse.body);
    PostsResponse response = PostsResponse.fromJson(apiresponse.body);
    print(response);
    return response;
  }
}


Future<void> main(List<String> args) async {
  final server = Server([PostsService()]);
  await server.serve(port: 50052);
  print('Server listening on port ${server.port}...');
}