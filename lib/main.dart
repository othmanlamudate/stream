import 'package:flutter/material.dart';

import 'views/Home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.white,
        fontFamily: "Georgia",
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
