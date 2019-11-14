///
//  Generated code. Do not modify.
//  source: counter.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'counter.pb.dart' as $0;
export 'counter.pb.dart';

class CounterClient extends $grpc.Client {
  static final _$getCounter =
      $grpc.ClientMethod<$0.CounterRequest, $0.CounterResponse>(
          '/counter.Counter/getCounter',
          ($0.CounterRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.CounterResponse.fromBuffer(value));

  CounterClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.CounterResponse> getCounter($0.CounterRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getCounter, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class CounterServiceBase extends $grpc.Service {
  $core.String get $name => 'counter.Counter';

  CounterServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CounterRequest, $0.CounterResponse>(
        'getCounter',
        getCounter_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CounterRequest.fromBuffer(value),
        ($0.CounterResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.CounterResponse> getCounter_Pre(
      $grpc.ServiceCall call, $async.Future<$0.CounterRequest> request) async {
    return getCounter(call, await request);
  }

  $async.Future<$0.CounterResponse> getCounter(
      $grpc.ServiceCall call, $0.CounterRequest request);
}
