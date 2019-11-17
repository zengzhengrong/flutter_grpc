import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  @override
  PostsState get initialState => InitialPostsState();

  @override
  Stream<PostsState> mapEventToState(
    PostsEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
