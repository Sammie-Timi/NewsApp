class Category {
  String message;
  Data data;

  Category({required this.message, required this.data});
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      message: json['message'],
      data: Data.fromJson(json['data']),
    );
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
      data: List<Datum>.from(json['data'].map((e) => Datum.fromJson(e))),
    );
  }

  Map<String, dynamic> toJson() {
    return {'data': data.map((e) => e.toJson()).toList()};
  }
}

class Datum {
  int categoryId;
  String categoryName;
  int totalStories;
  DateTime createdAt;
  DateTime updatedAt;

  Datum({
    required this.categoryId,
    required this.categoryName,
    required this.totalStories,
    required this.createdAt,
    required this.updatedAt,
  });
  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      categoryId: json['category_id'],
      categoryName: json['category_name'],
      totalStories: json['total_stories'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt:  DateTime.parse(json['updated_at']),
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
