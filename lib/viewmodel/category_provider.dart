import 'package:flutter/material.dart';

import 'package:news_app/models/category.dart';
import 'package:news_app/data/api/api_service.dart';

class CategoryProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<Category> _categories = [];

  late bool _isLoading = false;

  List<Category> get categories => _categories;

  bool get isLoading => _isLoading;

  Future<void> loadCategories() async {
    _isLoading = true;
    notifyListeners();
    try {
      _categories = await _apiService.fetchCategories();
    } catch (e) {
      throw Exception('Error fetching categories: $e');
    }
    _isLoading = false;
    notifyListeners();
  }
}
