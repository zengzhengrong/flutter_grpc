///
//  Generated code. Do not modify.
//  source: posts.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/wrappers.pb.dart' as $1;

class PostsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('PostsRequest', package: const $pb.PackageName('posts'), createEmptyInstance: create)
    ..aOS(1, 'host')
    ..a<$core.int>(2, 'port', $pb.PbFieldType.O3)
    ..a<$core.int>(3, 'page', $pb.PbFieldType.O3)
    ..a<$core.int>(4, 'perPage', $pb.PbFieldType.O3)
    ..m<$core.String, $core.String>(5, 'kwargs', entryClassName: 'PostsRequest.KwargsEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('posts'))
    ..hasRequiredFields = false
  ;

  PostsRequest._() : super();
  factory PostsRequest() => create();
  factory PostsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PostsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  PostsRequest clone() => PostsRequest()..mergeFromMessage(this);
  PostsRequest copyWith(void Function(PostsRequest) updates) => super.copyWith((message) => updates(message as PostsRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PostsRequest create() => PostsRequest._();
  PostsRequest createEmptyInstance() => create();
  static $pb.PbList<PostsRequest> createRepeated() => $pb.PbList<PostsRequest>();
  @$core.pragma('dart2js:noInline')
  static PostsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PostsRequest>(create);
  static PostsRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get host => $_getSZ(0);
  @$pb.TagNumber(1)
  set host($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHost() => $_has(0);
  @$pb.TagNumber(1)
  void clearHost() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get port => $_getIZ(1);
  @$pb.TagNumber(2)
  set port($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPort() => $_has(1);
  @$pb.TagNumber(2)
  void clearPort() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get page => $_getIZ(2);
  @$pb.TagNumber(3)
  set page($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPage() => $_has(2);
  @$pb.TagNumber(3)
  void clearPage() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get perPage => $_getIZ(3);
  @$pb.TagNumber(4)
  set perPage($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPerPage() => $_has(3);
  @$pb.TagNumber(4)
  void clearPerPage() => clearField(4);

  @$pb.TagNumber(5)
  $core.Map<$core.String, $core.String> get kwargs => $_getMap(4);
}

class PostsResponse_Post extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('PostsResponse.Post', package: const $pb.PackageName('posts'), createEmptyInstance: create)
    ..a<$core.int>(1, 'id', $pb.PbFieldType.O3)
    ..aOS(2, 'category')
    ..aOS(3, 'title')
    ..aOS(4, 'body')
    ..aOS(5, 'created')
    ..aOM<$1.StringValue>(6, 'updated', subBuilder: $1.StringValue.create)
    ..hasRequiredFields = false
  ;

  PostsResponse_Post._() : super();
  factory PostsResponse_Post() => create();
  factory PostsResponse_Post.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PostsResponse_Post.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  PostsResponse_Post clone() => PostsResponse_Post()..mergeFromMessage(this);
  PostsResponse_Post copyWith(void Function(PostsResponse_Post) updates) => super.copyWith((message) => updates(message as PostsResponse_Post));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PostsResponse_Post create() => PostsResponse_Post._();
  PostsResponse_Post createEmptyInstance() => create();
  static $pb.PbList<PostsResponse_Post> createRepeated() => $pb.PbList<PostsResponse_Post>();
  @$core.pragma('dart2js:noInline')
  static PostsResponse_Post getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PostsResponse_Post>(create);
  static PostsResponse_Post _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get category => $_getSZ(1);
  @$pb.TagNumber(2)
  set category($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCategory() => $_has(1);
  @$pb.TagNumber(2)
  void clearCategory() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get title => $_getSZ(2);
  @$pb.TagNumber(3)
  set title($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearTitle() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get body => $_getSZ(3);
  @$pb.TagNumber(4)
  set body($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBody() => $_has(3);
  @$pb.TagNumber(4)
  void clearBody() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get created => $_getSZ(4);
  @$pb.TagNumber(5)
  set created($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCreated() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreated() => clearField(5);

  @$pb.TagNumber(6)
  $1.StringValue get updated => $_getN(5);
  @$pb.TagNumber(6)
  set updated($1.StringValue v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasUpdated() => $_has(5);
  @$pb.TagNumber(6)
  void clearUpdated() => clearField(6);
  @$pb.TagNumber(6)
  $1.StringValue ensureUpdated() => $_ensure(5);
}

class PostsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('PostsResponse', package: const $pb.PackageName('posts'), createEmptyInstance: create)
    ..a<$core.int>(1, 'page', $pb.PbFieldType.O3)
    ..a<$core.int>(2, 'pages', $pb.PbFieldType.O3)
    ..a<$core.int>(3, 'perPage', $pb.PbFieldType.O3)
    ..a<$core.int>(4, 'total', $pb.PbFieldType.O3)
    ..pc<PostsResponse_Post>(5, 'items', $pb.PbFieldType.PM, subBuilder: PostsResponse_Post.create)
    ..hasRequiredFields = false
  ;

  PostsResponse._() : super();
  factory PostsResponse() => create();
  factory PostsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PostsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  PostsResponse clone() => PostsResponse()..mergeFromMessage(this);
  PostsResponse copyWith(void Function(PostsResponse) updates) => super.copyWith((message) => updates(message as PostsResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PostsResponse create() => PostsResponse._();
  PostsResponse createEmptyInstance() => create();
  static $pb.PbList<PostsResponse> createRepeated() => $pb.PbList<PostsResponse>();
  @$core.pragma('dart2js:noInline')
  static PostsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PostsResponse>(create);
  static PostsResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get page => $_getIZ(0);
  @$pb.TagNumber(1)
  set page($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPage() => $_has(0);
  @$pb.TagNumber(1)
  void clearPage() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get pages => $_getIZ(1);
  @$pb.TagNumber(2)
  set pages($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPages() => $_has(1);
  @$pb.TagNumber(2)
  void clearPages() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get perPage => $_getIZ(2);
  @$pb.TagNumber(3)
  set perPage($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPerPage() => $_has(2);
  @$pb.TagNumber(3)
  void clearPerPage() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get total => $_getIZ(3);
  @$pb.TagNumber(4)
  set total($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTotal() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotal() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<PostsResponse_Post> get items => $_getList(4);
}

