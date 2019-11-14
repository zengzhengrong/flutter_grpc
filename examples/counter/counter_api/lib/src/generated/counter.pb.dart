///
//  Generated code. Do not modify.
//  source: counter.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'counter.pbenum.dart';

export 'counter.pbenum.dart';

class CounterRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CounterRequest', package: const $pb.PackageName('counter'), createEmptyInstance: create)
    ..a<$core.int>(1, 'number', $pb.PbFieldType.O3)
    ..a<$core.int>(2, 'breadth', $pb.PbFieldType.O3)
    ..e<CounterRequest_Operator>(3, 'type', $pb.PbFieldType.OE, defaultOrMaker: CounterRequest_Operator.Increment, valueOf: CounterRequest_Operator.valueOf, enumValues: CounterRequest_Operator.values)
    ..hasRequiredFields = false
  ;

  CounterRequest._() : super();
  factory CounterRequest() => create();
  factory CounterRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CounterRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CounterRequest clone() => CounterRequest()..mergeFromMessage(this);
  CounterRequest copyWith(void Function(CounterRequest) updates) => super.copyWith((message) => updates(message as CounterRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CounterRequest create() => CounterRequest._();
  CounterRequest createEmptyInstance() => create();
  static $pb.PbList<CounterRequest> createRepeated() => $pb.PbList<CounterRequest>();
  @$core.pragma('dart2js:noInline')
  static CounterRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CounterRequest>(create);
  static CounterRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get number => $_getIZ(0);
  @$pb.TagNumber(1)
  set number($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearNumber() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get breadth => $_getIZ(1);
  @$pb.TagNumber(2)
  set breadth($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBreadth() => $_has(1);
  @$pb.TagNumber(2)
  void clearBreadth() => clearField(2);

  @$pb.TagNumber(3)
  CounterRequest_Operator get type => $_getN(2);
  @$pb.TagNumber(3)
  set type(CounterRequest_Operator v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);
}

class CounterResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CounterResponse', package: const $pb.PackageName('counter'), createEmptyInstance: create)
    ..a<$core.int>(1, 'number', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  CounterResponse._() : super();
  factory CounterResponse() => create();
  factory CounterResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CounterResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CounterResponse clone() => CounterResponse()..mergeFromMessage(this);
  CounterResponse copyWith(void Function(CounterResponse) updates) => super.copyWith((message) => updates(message as CounterResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CounterResponse create() => CounterResponse._();
  CounterResponse createEmptyInstance() => create();
  static $pb.PbList<CounterResponse> createRepeated() => $pb.PbList<CounterResponse>();
  @$core.pragma('dart2js:noInline')
  static CounterResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CounterResponse>(create);
  static CounterResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get number => $_getIZ(0);
  @$pb.TagNumber(1)
  set number($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearNumber() => clearField(1);
}

