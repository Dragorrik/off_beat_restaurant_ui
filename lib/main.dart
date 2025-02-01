import 'package:flutter/material.dart';
import 'package:off_beat_restaurant/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Offbeat Restaurant',
      theme: ThemeData(),
      home: HomeScreen(),
    );
  }
}
