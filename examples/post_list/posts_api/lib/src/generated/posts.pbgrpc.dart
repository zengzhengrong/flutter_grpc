///
//  Generated code. Do not modify.
//  source: posts.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'posts.pb.dart' as $0;
export 'posts.pb.dart';

class PostsClient extends $grpc.Client {
  static final _$getPosts =
      $grpc.ClientMethod<$0.PostsRequest, $0.PostsResponse>(
          '/posts.Posts/getPosts',
          ($0.PostsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.PostsResponse.fromBuffer(value));

  PostsClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.PostsResponse> getPosts($0.PostsRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$getPosts, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class PostsServiceBase extends $grpc.Service {
  $core.String get $name => 'posts.Posts';

  PostsServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.PostsRequest, $0.PostsResponse>(
        'getPosts',
        getPosts_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PostsRequest.fromBuffer(value),
        ($0.PostsResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.PostsResponse> getPosts_Pre(
      $grpc.ServiceCall call, $async.Future<$0.PostsRequest> request) async {
    return getPosts(call, await request);
  }

  $async.Future<$0.PostsResponse> getPosts(
      $grpc.ServiceCall call, $0.PostsRequest request);
}
