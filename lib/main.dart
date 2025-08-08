import 'package:flutter/material.dart';
import 'package:news_app/Core/Utilis/responsive.dart';
import 'package:news_app/viewmodel/category_provider.dart';
import 'package:news_app/view/Screens/home.dart';
import 'package:news_app/viewmodel/bookmark_provider.dart';
import 'package:provider/provider.dart';

void main() {
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
