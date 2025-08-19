import 'package:news_app/Feature/Home/model/story.dart';

class TopStory {
  final int id;
  final StoryDetails story;
  final DateTime createdAt;
  final DateTime updatedAt;

  TopStory({
    required this.id,
    required this.story,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TopStory.fromJson(Map<String, dynamic> json) {
    return TopStory(
      id: json['id'],
      story: StoryDetails.fromJson(json['story']),
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
