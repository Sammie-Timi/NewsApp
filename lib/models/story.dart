import 'package:news_app/models/Category.dart';

class Story {
  String message;
  Data data;

  Story({required this.message, required this.data});
  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(message: json['message'], data: Data.fromJson(json['data']));
  }
  Map<String, dynamic> toJson() {
    return {'message': message, 'data': data.toJson()};
  }
}

class Data {
  List<Datum> data;

  Data({required this.data});
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      data: List<Datum>.from(json['data'].Map((e) => Datum.fromJson(e))),
    );
  }
  Map<String, dynamic> toJson() {
    return {'data': data.map((e) => e.toJson()).toList()};
  }
}

class Datum {
  int id;
  StoryClass story;
  DateTime createdAt;
  DateTime updatedAt;

  Datum({
    required this.id,
    required this.story,
    required this.createdAt,
    required this.updatedAt,
  });
  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json['id'],
      story: StoryClass.fromJson(json['story']),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'story': story.toJson(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}

class StoryClass {
  int id;
  String title;
  String subtitle;
  String description;
  String status;
  String type;
  String author;
  String content;
  String featured;
  int views;
  dynamic editorsPick;
  dynamic topStory;
  Category category;
  String bannerImage;
  DateTime createdAt;
  DateTime updatedAt;

  StoryClass({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.status,
    required this.type,
    required this.author,
    required this.content,
    required this.featured,
    required this.views,
    required this.editorsPick,
    required this.topStory,
    required this.category,
    required this.bannerImage,
    required this.createdAt,
    required this.updatedAt,
  });
  factory StoryClass.fromJson(Map<String, dynamic> json) {
    return StoryClass(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      description: json['description'],
      status: json['status'],
      type: json['type'],
      author: json['author'],
      content: json['content'],
      featured: json['featured'].toString(),
      views: json['views'],
      editorsPick: json['editors_pick'],
      topStory: json['top_story'],
      category: Category.fromJson(json['category']),
      bannerImage: json['banner_image'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'description': description,
      'status': status,
      'type': type,
      'author': author,
      'content': content,
      'featured': featured,
      'views': views,
      'editors_pick': editorsPick,
      'top_story': topStory,
      'category': category.toJson(),
      'banner_image': bannerImage,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
