import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:post_list/models/models.dart';
import 'package:posts_api/posts_api.dart';
import './bloc.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  @override
  PostsState get initialState => InitialPostsState();

  @override
  Stream<PostsState> mapEventToState(
    PostsEvent event,
  ) async* {
    final currentState = state;
    // print(currentState);
    // if (currentState is InitialPostsState) {
    //   try {
    //     final response = await PostClientApi().getposts();
    //     final List<Post> posts = List<Post>.from(response.items
    //         .map((item) => tomap(item))
    //         .map((mapitem) => Post.fromJson(mapitem)));
    //     yield PostsLoaded(
    //         posts: posts,
    //         pages: response.pages,
    //         perPage: response.perPage,
    //         total: response.total,
    //         hasReachedMax: response.items.isEmpty ? true : false);
    //   } catch (e) {
    //     print('getpost init error:$e');
    //     yield PostsError();
    //   }
    // }
    if (event is GetPostsEvent && !_hasReachedMax(currentState)) {
      if (currentState is InitialPostsState) {
        try {
          yield PostsLoading();
          final response = await PostClientApi().getposts();
          final List<Post> posts = List<Post>.from(response.items
              .map((item) => tomap(item))
              .map((mapitem) => Post.fromJson(mapitem)));
          yield PostsLoaded(
              posts: posts,
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
          final response = await PostClientApi().getposts(page: currentState.pages + 1);
          final List<Post> posts = List<Post>.from(response.items
              .map((item) => tomap(item))
              .map((mapitem) => Post.fromJson(mapitem)));
          // final List<Map<String, dynamic>> posts = response.items.map((item) => tomap(item)).toList();
          // List<Post> pp = [];
          // for (Map<String, dynamic> post in posts){
          //   // print(post);
          //   final p = Post.fromJson(post);
          //   // print(p.runtimeType);
          //   pp.add(p);
          //   print(pp);
          // }
          // .map((mapitem) => Post.fromJson(mapitem));
          // print(posts.runtimeType);
          // print(posts);
          // print(response);

          yield posts.isEmpty
              ? currentState.copyWith(hasReachedMax: true)
              : PostsLoaded(
                  posts: currentState.posts + posts,
                  pages: response.pages,
                  perPage: response.perPage,
                  total: response.total,
                  hasReachedMax: response.items.isEmpty ? true : false);
        } catch (e) {
          print('getpost error:$e');
          yield PostsError();
        }
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
