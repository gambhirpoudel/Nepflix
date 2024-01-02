import 'package:flutter/material.dart';
import 'package:nepflix/components/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: const Home(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark));
  }
}
