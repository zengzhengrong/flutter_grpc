///
//  Generated code. Do not modify.
//  source: posts.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const PostsRequest$json = const {
  '1': 'PostsRequest',
  '2': const [
    const {'1': 'host', '3': 1, '4': 1, '5': 9, '10': 'host'},
    const {'1': 'port', '3': 2, '4': 1, '5': 5, '10': 'port'},
    const {'1': 'page', '3': 3, '4': 1, '5': 5, '10': 'page'},
    const {'1': 'per_page', '3': 4, '4': 1, '5': 5, '10': 'perPage'},
  ],
};

const PostsResponse$json = const {
  '1': 'PostsResponse',
  '2': const [
    const {'1': 'page', '3': 1, '4': 1, '5': 5, '10': 'page'},
    const {'1': 'pages', '3': 2, '4': 1, '5': 5, '10': 'pages'},
    const {'1': 'per_page', '3': 3, '4': 1, '5': 5, '10': 'perPage'},
    const {'1': 'total', '3': 4, '4': 1, '5': 5, '10': 'total'},
    const {'1': 'items', '3': 5, '4': 3, '5': 11, '6': '.posts.PostsResponse.Post', '10': 'items'},
  ],
  '3': const [PostsResponse_Post$json],
};

const PostsResponse_Post$json = const {
  '1': 'Post',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'category', '3': 2, '4': 1, '5': 9, '10': 'category'},
    const {'1': 'title', '3': 3, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'body', '3': 4, '4': 1, '5': 9, '10': 'body'},
    const {'1': 'created', '3': 5, '4': 1, '5': 9, '10': 'created'},
    const {'1': 'updated', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'updated'},
  ],
};

