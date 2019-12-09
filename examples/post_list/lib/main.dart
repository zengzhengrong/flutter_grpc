import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_list/posts_bloc/bloc.dart';
import 'package:bloc/bloc.dart';
import './models/models.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Post List Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(title: Text('Posts')),
          body: BlocProvider(
              create: (context) => PostsBloc(locationTimeZone: 'Asia/Shanghai')
                ..add(GetPostsEvent()),
              child: MyHomePage())),
    );
  }
}

class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: SizedBox(
          width: 33,
          height: 33,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  PostsBloc _postBloc;
  Completer<void> _refreshCompleter;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _postBloc = BlocProvider.of<PostsBloc>(context);
    _refreshCompleter = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PostsBloc, PostsState>(
      listener: (context, state) {
        if (state is PostsRefreshed) {
          _refreshCompleter?.complete();
          _refreshCompleter = Completer<void>();
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: state.newPostCount !=0 ? Text('${state.newPostCount} Updated Success !~') : Text('No Post Updated !~'),
              backgroundColor: state.newPostCount !=0 ? Colors.green[400] : Colors.blue,
            ),
          );
        }
      },
      child: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          if (state is PostsError) {
            return Center(
              child: Text('failed to fetch posts'),
            );
          }
          if (state is PostsLoaded) {
            if (state.posts.isEmpty) {
              return Center(
                child: Text('no posts'),
              );
            }
            return RefreshIndicator(
              onRefresh: () {
                BlocProvider.of<PostsBloc>(context).add(RefreshPosts());
                return _refreshCompleter.future;
              },
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return index >= state.posts.length
                      ? BottomLoader()
                      : PostWidget(post: state.posts[index]);
                },
                itemCount: state.hasReachedMax
                    ? state.posts.length
                    : state.posts.length + 1,
                controller: _scrollController,
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _postBloc.add(GetPostsEvent());
    }
  }
}

class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: false,
      title: Text(
        post.title,
        style: TextStyle(fontSize: 18),
      ),
      subtitle: Text(post.body, style: TextStyle(fontSize: 18)),
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.book),
          Text(post.category, style: TextStyle(fontSize: 18))
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                post.created['date'],
                style: TextStyle(fontSize: 18),
              ),
              Text(
                post.created['time'],
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          Icon(Icons.arrow_forward)
        ],
      ),
    );
  }
}
