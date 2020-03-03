///
//  Generated code. Do not modify.
//  source: keycloak.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Reply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Reply', package: const $pb.PackageName('keycloak'), createEmptyInstance: create)
    ..a<$core.int>(1, 'statuscode', $pb.PbFieldType.O3)
    ..aOS(2, 'message')
    ..hasRequiredFields = false
  ;

  Reply._() : super();
  factory Reply() => create();
  factory Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Reply clone() => Reply()..mergeFromMessage(this);
  Reply copyWith(void Function(Reply) updates) => super.copyWith((message) => updates(message as Reply));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Reply create() => Reply._();
  Reply createEmptyInstance() => create();
  static $pb.PbList<Reply> createRepeated() => $pb.PbList<Reply>();
  @$core.pragma('dart2js:noInline')
  static Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Reply>(create);
  static Reply _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get statuscode => $_getIZ(0);
  @$pb.TagNumber(1)
  set statuscode($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatuscode() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatuscode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);
}

