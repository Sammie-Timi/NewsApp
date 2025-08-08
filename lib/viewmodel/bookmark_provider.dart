import 'package:flutter/material.dart';
import 'package:news_app/core/services/localstorage/shared_pref.dart';
import 'package:news_app/models/story.dart';

class BookmarkProvider with ChangeNotifier {
  final StorageService _storageService = StorageService();
  List<StoryClass> _bookmarks = [];

  List<StoryClass> get bookmarks => _bookmarks;

  Future<void> loadBookmarks() async {
    try {
      _bookmarks = await _storageService.getBookmarks();
      notifyListeners();
    } catch (e) {
      throw Exception('An Error Occured: $e');
    }
  }


  Future<void> toggleBookmark(StoryClass story) async{
    final isMarked= _bookmarks.any((s)=>s.id == story.id);
    if(!isMarked){
        await _storageService.addBookmarks(story);
    }else {
        await _storageService.removeBookmarked(story.id);

    }
    await loadBookmarks();
  }

  bool isBookmarked(int id){
    return _bookmarks.any((s)=>s.id==id);
  }
}
