import 'dart:convert' show json;
import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final int id;
  final String category;
  final String title;
  final String body;
  final Map<String,String> created;
  final Map<String,String> updated;

  Post({this.id, this.category, this.title, this.body, this.created,
      this.updated});

  factory Post.fromJson(Map<String,dynamic> json) {
    return Post(
      id: json['id']?? 0 ,
      category: json['category']?? 'null',
      title: json['title']?? 'null',
      body: json['body']?? 'null',
      created: datetimeFormat(json['created']?? 'null'),
      updated: datetimeFormat(json['updated']?? 'null'),
    );
  }

  @override
  List<Object> get props => [id, category, title, body, created, updated];

  @override
  String toString() => 'Post { id: $id title: $title}';
}

Map<String,String> datetimeFormat(String datetime){
  if (datetime == 'null'){
    final Map<String,String> datetimeMap = {'date':'null',
  'time':'null'};
    return datetimeMap;
  }
  final List<String> dataTimeSplit = datetime.split('T');
  String timeFormat = dataTimeSplit[1].substring(0,8);
  dataTimeSplit[1] = timeFormat;
  final Map<String,String> datetimeMap = {'date':dataTimeSplit[0]?? 'null',
  'time':dataTimeSplit[1]?? 'null'};
  return datetimeMap;
}