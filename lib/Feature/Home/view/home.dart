import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFf1B1B1B),
        leading: Row(
          
          children: [
            Icon(Icons.align_horizontal_left, color: Colors.white),
            Spacer(),
            Icon(Icons.search_rounded, color: Colors.white),
          ],
        ),
      ),
      body: Column(),
    );
  }
}
