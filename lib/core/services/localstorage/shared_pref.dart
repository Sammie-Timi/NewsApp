import 'dart:convert';

import 'package:news_app/models/story.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String _bookmarkKey = 'bookmarked_stories';

  Future<void> saveBookmarks(List<StoryClass> story) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> encodedList = story
        .map((s) => jsonEncode(s.toJson()))
        .toList();
    await prefs.setStringList(_bookmarkKey, encodedList);
  }

  Future<List<StoryClass>> getBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? encodedList = prefs.getStringList(_bookmarkKey);
    if (encodedList != null) {
      return encodedList
          .map((item) => StoryClass.fromJson(jsonDecode(item)))
          .toList();
    }

    return [];
  }

  Future<void> addBookmarks(StoryClass story) async {
    List<StoryClass> bookmarks = await getBookmarks();

    if (!bookmarks.any((s) => s.id == story.id)) {
      bookmarks.add(story);
      await saveBookmarks(bookmarks);
    }
  }

  Future<void> removeBookmarked(int id) async {
    List<StoryClass> bookmarks = await getBookmarks();

    bookmarks.removeWhere((s) => s.id == id);
    await saveBookmarks(bookmarks);
  }

  Future<bool> isBookmarked(int id) async {
    List<StoryClass> bookmarks = await getBookmarks();
    return bookmarks.any((s) => s.id == id);
  }
}
