import 'package:flutter/material.dart';
import 'package:sportify_application/screens/login_screen.dart';
import 'package:sportify_application/screens/onboarding_screen.dart';
import 'package:sportify_application/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}
