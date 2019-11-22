import 'dart:async';
import 'package:grpc/grpc.dart';
import 'package:posts_api/posts_api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;

import 'package:posts_api/src/generated/google/protobuf/wrappers.pb.dart';

class PostsService extends PostsServiceBase {
  @override
  Future<PostsResponse> getPosts(ServiceCall call, PostsRequest request) async {
    final String apiUrl =
        'http://${request.host}:${request.port}/post/?page=${request.page}&per_page=${request.perPage}';
    print('request:$apiUrl');
    var apiresponse = await http.get(apiUrl);
    final dynamic data = json.decode(apiresponse.body);
    final List<PostsResponse_Post> posts = List<PostsResponse_Post>.from(
        data['items'].map((item) => generatePost(item)));
    final PostsResponse response = PostsResponse()
      ..items.addAll(posts)
      ..page = data['page']
      ..pages = data['pages']
      ..perPage = data['per_page']
      ..total = data['total'];
    return response;
  }

  PostsResponse_Post generatePost(Map<String, dynamic> item) {
    return PostsResponse_Post()
      ..id = item['id']
      ..category = item['category']
      ..title = item['title']
      ..body = item['body']
      ..created = item['created']
      ..updated = item['updated'] ?? StringValue();
  }
}

Future<void> main(List<String> args) async {
  final server = Server([PostsService()]);
  await server.serve(port: 50052);
  print('Server listening on port ${server.port}...');
}
