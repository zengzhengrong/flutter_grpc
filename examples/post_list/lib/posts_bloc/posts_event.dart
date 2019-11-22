import 'package:equatable/equatable.dart';

abstract class PostsEvent extends Equatable {
  @override
  List<Object> get props => null;

  const PostsEvent();
}

class GetPostsEvent extends PostsEvent{
  final int page;
  GetPostsEvent({this.page});
  @override
  List<Object> get props => [page];
}