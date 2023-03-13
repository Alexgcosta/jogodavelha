import 'package:flutter/material.dart';
import 'package:jogodavelha/pages/game_page.dart';
import 'package:jogodavelha/core/theme_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Game_TITlE',
      theme: themeApp,
      home: GamePage(),
    );
  }
}

