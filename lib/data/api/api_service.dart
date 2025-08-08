import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/models/category.dart';

class ApiService {
  static const String baseUrl = 'https://api.agcnewsnet.com/api/';

  Future<List<Category>> fetchCategories() async {
    final response = await http.get(Uri.parse('$baseUrl/general/categories'));
    try {
      if (response.statusCode == 200 ||response.statusCode == 200 ) {
        final List jsondata = jsonDecode(response.body);
        return jsondata.map((e) => Category.fromJson(e)).toList();
      } else {
        throw Exception(' Unable to laod categories');
      }
    } catch (e) {
      throw Exception('Error occured: $e');
    }
  }

Future<List<

}
