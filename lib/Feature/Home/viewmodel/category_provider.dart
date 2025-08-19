import 'package:flutter/material.dart';
import 'package:news_app/Feature/Home/model/category.dart';
import 'package:news_app/core/enum/enum.dart';
import 'package:news_app/core/data/api/api_service.dart';

class CategoryProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  StoryState _state = StoryState.initial;
  List<Category> _categories = [];
  String? _errorMessage;

  StoryState get state => _state;
  List<Category> get categories => _categories;
  String? get errorMessage => _errorMessage;

  Future<void> loadCategories() async {
    _state = StoryState.loading;
    _errorMessage = null;
    notifyListeners();
    try {
      _categories = await _apiService.fetchCategories();
      if (_categories.isEmpty) {
        _state = StoryState.error;
        _errorMessage = "No categories found";
      } else {
        _state = StoryState.loaded;
      }
    } catch (e) {
      _errorMessage = e.toString();
      _state = StoryState.error;
    }
    notifyListeners();
  }

  Future<void> refreshCategories() async {
  await loadCategories();
}
}
