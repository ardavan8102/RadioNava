import 'package:flutter/material.dart';
import 'package:radio_nava/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Radio Nava',
      home: SplashScreen(),
    );
  }
}