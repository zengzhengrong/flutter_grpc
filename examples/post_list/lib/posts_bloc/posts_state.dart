import 'package:equatable/equatable.dart';
import 'package:post_list/models/post.dart';

abstract class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

class InitialPostsState extends PostsState {}

class PostsError extends PostsState {}

class PostsLoaded extends PostsState {
  final List<Post> posts;
  final bool hasReachedMax;
  final int page;
  final int pages;
  final int perPage;
  final int total;

  const PostsLoaded(
      {this.posts, this.hasReachedMax,this.page, this.pages, this.perPage, this.total});

  PostsLoaded copyWith({
    List<Post> posts,
    bool hasReachedMax,
  }) {
    return PostsLoaded(
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [posts, hasReachedMax,page,pages,perPage,total];

  @override
  String toString() =>
      'PostLoaded { posts: ${posts.length},currrent_page: $page,total_pages $pages hasReachedMax: $hasReachedMax }';
}
