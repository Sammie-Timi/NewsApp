import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/Feature/Home/model/category.dart';
import 'package:news_app/Feature/Home/model/story.dart';
import 'package:news_app/Feature/Home/model/top_story.dart';


class ApiService {
  static const String baseUrl = 'https://api.agcnewsnet.com/api/general';

  Future<List<Category>> fetchCategories() async {
    final url = Uri.parse('$baseUrl/categories');
    print("Fetching categories from: $url");
    final response = await http.get(url);
    print("Status code: ${response.statusCode}");
    print("Response body: ${response.body}");

    try {
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);
        final categoriesResponse = CategoriesResponse.fromJson(jsonData);
        return categoriesResponse.data;
      } else {
        throw Exception("Failed with status code ${response.statusCode}");
      }
    } catch (e) {
      throw Exception('Error occurred: ${e.toString()}');
    }
  }

  Future<StoryDetails> fetchSingleStory(int storyId) async {
    final url = Uri.parse('$baseUrl/stories/$storyId');
    final response = await http.get(url);

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);
        final story = StoryDetails.fromJson(jsonData['data']);
        return story;
      } else {
        throw Exception("Failed with status code ${response.statusCode}");
      }
    } catch (e) {
      throw Exception('Error occurred: ${e.toString()}');
    }
  }

  Future<List<TopStory>> fetchTopStory() async {
    final url = Uri.parse('$baseUrl/top-stories');
    final response = await http.get(url);
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);
        final List<dynamic> topStoriesJson = jsonData['data']['data'];
        return topStoriesJson.map((json) => TopStory.fromJson(json)).toList();
      } else {
        throw Exception("Failed with status code ${response.statusCode}");
      }
    } catch (e) {
      throw Exception('Error occurred: ${e.toString()}');
    }
  }

  Future<List<StoryDetails>> fetchLatestStory(int page, int perPage) async {
    final url = Uri.parse('$baseUrl/stories/latest-stories?page=1&per_page=7');
    final response = await http.get(url);
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);
        final List<dynamic> story = jsonData['data']['data'];
        return story.map((json) => StoryDetails.fromJson(json)).toList();
      } else {
        throw Exception("Failed with status code ${response.statusCode}");
      }
    } catch (e) {
      throw Exception('Error occurred: ${e.toString()}');
    }
  }

  Future<List<StoryDetails>> fetchMissedStory(int page, int perPage) async {
    final url = Uri.parse('$baseUrl/stories/missed-stories?page=1&per_page=5');
    final response = await http.get(url);
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);
        final List<dynamic> story = jsonData['data']['data'];
        return story.map((json) => StoryDetails.fromJson(json)).toList();
      } else {
        throw Exception("Failed with status code ${response.statusCode}");
      }
    } catch (e) {
      throw Exception('Error occurred: ${e.toString()}');
    }
  }

  Future<List<TopStory>> fetchEditorsPick(int page, int perPage) async {
    final url = Uri.parse('$baseUrl/editor-picks?page=1&per_page=15');
    final response = await http.get(url);
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);
        final List<dynamic> pick = jsonData['data']['data'];
        return pick.map((json) => TopStory.fromJson(json)).toList();
      } else {
        throw Exception("Failed with status code ${response.statusCode}");
      }
    } catch (e) {
      throw Exception('Error occurred: ${e.toString()}');
    }
  }

  Future<List<StoryDetails>> fetchCategoryStories(int categoryId) async {
    final url = Uri.parse(
      '$baseUrl/categories/$categoryId/stories?page=1&per_page=15',
    );
    final response = await http.get(url);
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);
        final List<dynamic> story = jsonData['data']['data'];
        return story.map((json) => StoryDetails.fromJson(json)).toList();
      } else {
        throw Exception("Failed with status code ${response.statusCode}");
      }
    } catch (e) {
      throw Exception('Error occurred: ${e.toString()}');
    }
  }
}
