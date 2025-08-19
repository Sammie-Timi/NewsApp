import 'package:flutter/material.dart';
import 'package:news_app/core/services/localstorage/shared_pref.dart';
import 'package:news_app/models/story.dart';

class BookmarkProvider with ChangeNotifier {
  final StorageService _storageService = StorageService();
  List<StoryDetails> _bookmarks = [];

  List<StoryDetails> get bookmarks => _bookmarks;

  Future<void> loadBookmarks() async {
    try {
      _bookmarks = await _storageService.getBookmarks();
      notifyListeners();
    } catch (e) {
      throw Exception('An Error Occured: $e');
    }
  }

  Future<bool> toggleBookmark(StoryDetails story) async {
    final isMarked = _bookmarks.any((s) => s.id == story.id);
    bool newStatus;
    if (isMarked) {
      await _storageService.removeBookmarked(story.id);
      newStatus = false;
    } else {
      await _storageService.addBookmarks(story);
      newStatus = true;
    }
     notifyListeners();
    await loadBookmarks();
    return newStatus; 
  }

  bool isBookmarked(int id) {
    return _bookmarks.any((s) => s.id == id);
  }
}
