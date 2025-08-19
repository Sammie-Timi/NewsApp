import 'package:flutter/material.dart';
import 'package:news_app/Core/Utilis/responsive.dart';
import 'package:news_app/core/data/api/api_service.dart';
import 'package:news_app/Feature/Home/viewmodel/category_provider.dart';
import 'package:news_app/Feature/Home/view/home.dart';
import 'package:news_app/Feature/Bookmarked/viewmodel/bookmark_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  final api = ApiService();
  try {
    final categories = await api.fetchCategories();
    print("Fetched ${categories.length} categories:");
    for (var category in categories) {
      print("${category.categoryId} - ${category.categoryName}");
    }
  } catch (e) {
    print("Error: $e");
  }


  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BookmarkProvider()..loadBookmarks(),
        ),
        ChangeNotifierProvider(create: (_)=> CategoryProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Home(),
    );
  }
}
