import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_list/posts_bloc/bloc.dart';
import './models/models.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        builder: (context) => PostsBloc()..add(GetPostsEvent()),
        child: MaterialApp(
          title: 'Post List Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(title: 'Post Home'),
        ));
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
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _posts = <Post>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _smallFont = const TextStyle(fontSize: 12.0);

  Widget _buildPosts() {
    final bloc = BlocProvider.of<PostsBloc>(context);
    // ..add(GetPostsEvent());

    return BlocBuilder<PostsBloc, PostsState>(builder: (context, state) {
      if (state is PostsLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is PostsLoaded) {
        // _posts.addAll(state.posts);

        return ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemBuilder: (context, i) {
            if (i.isOdd) return Divider();

            final index = i ~/ 2;
            // print(index);

            if (index >= _posts.length) {
              // ..add(GetPostsEvent())
              print('index:' + index.toString());
              print('length:' + _posts.length.toString());
              // _posts.addAll(state.posts);
              // bloc.add(GetPostsEvent(page: state.pages + 1));
              // _posts.addAll(state.posts);
              print(_posts);
              if (state is PostsLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }

            return index >= state.posts.length
                ? BottomLoader()
                : _buildRow(state.posts[index]);
          },
        );
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }

  Widget _buildRow(Post pair) {
    return ListTile(
      isThreeLine: false,
      title: Text(
        pair.title,
        style: _biggerFont,
      ),
      subtitle: Text(pair.body, style: _smallFont),
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.book),
          Text(pair.category, style: _biggerFont)
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
                pair.created['date'],
                style: _smallFont,
              ),
              Text(
                pair.created['time'],
                style: _smallFont,
              ),
            ],
          ),
          Icon(Icons.arrow_forward)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), centerTitle: true),
      body: _buildPosts(),
    );
  }
}
