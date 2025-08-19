import 'package:news_app/Feature/Home/model/category.dart';

class Story {
  final String message;
  final List<StoryDetails> stories;

  Story({required this.message, required this.stories});

  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
      message: json['message'],
      stories: List<StoryDetails>.from(
        json['data']['data'].map((e) => StoryDetails.fromJson(e['story'])),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'data': {
        'data': stories.map((e) => {'story': e.toJson()}).toList(),
      }
    };
  }
}

class StoryDetails {
  final int id;
  final String title;
  final String subtitle;
  final String description;
  final String status;
  final String type;
  final String author;
  final String content;
  final String featured;
  final int views;
  final dynamic editorsPick;
  final dynamic topStory;
  final Category category;
  final String bannerImage;
  final DateTime createdAt;
  final DateTime updatedAt;

  StoryDetails({
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

  factory StoryDetails.fromJson(Map<String, dynamic> json) {
    return StoryDetails(
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
