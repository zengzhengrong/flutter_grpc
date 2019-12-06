import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:post_list/models/models.dart';
import 'package:posts_api/posts_api.dart';
import 'package:rxdart/rxdart.dart';
import './bloc.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  @override
  PostsState get initialState => InitialPostsState();
  @override
  Stream<PostsState> transformEvents(
    Stream<PostsEvent> events,
    Stream<PostsState> Function(PostsEvent event) next,
  ) {
    return super.transformEvents(
      (events as Observable<PostsEvent>).debounceTime(
        Duration(milliseconds: 500),
      ),
      next,
    );
  }

  @override
  Stream<PostsState> mapEventToState(
    PostsEvent event,
  ) async* {
    final currentState = state;
    if (event is GetPostsEvent && !_hasReachedMax(currentState)) {
      if (currentState is InitialPostsState) {
        try {
          final response = await PostClientApi().getposts();

          final List<Post> posts = List<Post>.from(response.items
              .map((item) => tomap(item))
              .map((mapitem) => Post.fromJson(mapitem)));
          yield PostsLoaded(
              posts: posts,
              page: response.page,
              pages: response.pages,
              perPage: response.perPage,
              total: response.total,
              hasReachedMax: response.items.isEmpty ? true : false);
          return;
        } catch (e) {
          print('getpost init error:$e');
          yield PostsError();
        }
      }
      if (currentState is PostsLoaded) {
        try {
          print('current page : ${currentState.page}');
          final response =
              await PostClientApi().getposts(page: currentState.page + 1);
          final List<Post> posts = List<Post>.from(response.items
              .map((item) => tomap(item))
              .map((mapitem) => Post.fromJson(mapitem)));

          yield posts.isEmpty
              ? currentState.copyWith(hasReachedMax: true)
              : PostsLoaded(
                  posts: currentState.posts + posts,
                  page: response.page,
                  pages: response.pages,
                  perPage: response.perPage,
                  total: response.total,
                  hasReachedMax: false);
        } catch (e) {
          print('getpost error:$e');
          yield PostsError();
        }
      }
    }
    if (event is RefreshPosts) {
      try {
        final response = await PostClientApi().getposts();
        final List<Post> posts = List<Post>.from(response.items
            .map((item) => tomap(item))
            .map((mapitem) => Post.fromJson(mapitem)));
        yield InitialPostsState();
        yield PostsLoaded(
            posts: posts,
            page: response.page,
            pages: response.pages,
            perPage: response.perPage,
            total: response.total,
            hasReachedMax: response.items.isEmpty ? true : false);
        return;
      } catch (_) {
        print(_);
        yield state;
      }
    }
  }

  bool _hasReachedMax(PostsState state) =>
      state is PostsLoaded && state.hasReachedMax;

  Map<String, dynamic> tomap(PostsResponse_Post post) {
    final Map<String, dynamic> data = {};
    data['id'] = post.id;
    data['category'] = post.category;
    data['title'] = post.title;
    data['body'] = post.body;
    data['created'] = post.created;
    data['updated'] =
        post.updated.toString().isNotEmpty ? post.updated.toString() : null;
    return data;
  }
}
