import 'package:flutter/material.dart';
import 'package:radio_nava/splash.dart';
import 'package:radio_nava/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        '/' : (context) => SplashScreen(),
        '/home' : (context) => HomePage(),
      },
    );
  }
}