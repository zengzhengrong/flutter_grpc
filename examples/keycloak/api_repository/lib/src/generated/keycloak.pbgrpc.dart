///
//  Generated code. Do not modify.
//  source: keycloak.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'google/protobuf/empty.pb.dart' as $0;
import 'keycloak.pb.dart' as $1;
export 'keycloak.pb.dart';

class KeycloakServiceClient extends $grpc.Client {
  static final _$public = $grpc.ClientMethod<$0.Empty, $1.Reply>(
      '/keycloak.KeycloakService/Public',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Reply.fromBuffer(value));
  static final _$secured = $grpc.ClientMethod<$0.Empty, $1.Reply>(
      '/keycloak.KeycloakService/Secured',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Reply.fromBuffer(value));

  KeycloakServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$1.Reply> public($0.Empty request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$public, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$1.Reply> secured($0.Empty request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$secured, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class KeycloakServiceBase extends $grpc.Service {
  $core.String get $name => 'keycloak.KeycloakService';

  KeycloakServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.Reply>(
        'Public',
        public_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.Reply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.Reply>(
        'Secured',
        secured_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.Reply value) => value.writeToBuffer()));
  }

  $async.Future<$1.Reply> public_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return public(call, await request);
  }

  $async.Future<$1.Reply> secured_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return secured(call, await request);
  }

  $async.Future<$1.Reply> public($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$1.Reply> secured($grpc.ServiceCall call, $0.Empty request);
}
