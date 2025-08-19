class CategoriesResponse {
  final String message;
  final List<Category> data;

  CategoriesResponse({
    required this.message,
    required this.data,
  });

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) {
    return CategoriesResponse(
      message: json['message'],
      data: List<Category>.from(
        json['data']['data'].map((item) => Category.fromJson(item)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'data': {
        'data': data.map((category) => category.toJson()).toList(),
      },
    };
  }
}

class Category {
  final int categoryId;
  final String categoryName;
  final int totalStories;
  final DateTime createdAt;
  final DateTime updatedAt;

  Category({
    required this.categoryId,
    required this.categoryName,
    required this.totalStories,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoryId: json['category_id'],
      categoryName: json['category_name'],
      totalStories: json['total_stories'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category_id': categoryId,
      'category_name': categoryName,
      'total_stories': totalStories,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
