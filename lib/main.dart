import 'package:flutter/material.dart';
import 'package:sportify_application/screens/login_screen_old.dart';
import 'package:sportify_application/screens/login_screen2.dart';
import 'package:sportify_application/screens/onboarding_screen.dart';
import 'package:sportify_application/screens/players_screen.dart';
import 'package:sportify_application/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      //SplashScreen(),
    );
  }
}
