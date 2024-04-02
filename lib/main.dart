import 'package:flutter/material.dart';
import 'package:sportify_application/screens/login_screen.dart';
import 'package:sportify_application/screens/onboarding_screen.dart';
import 'package:sportify_application/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
