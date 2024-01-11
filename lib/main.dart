import 'package:flutter/material.dart';
import 'package:nepflix/components/homepage.dart';
// import 'package:nepflix/components/tvhome.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
    );
  }
}
