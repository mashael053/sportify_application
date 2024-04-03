import 'package:flutter/material.dart';
import 'package:sportify_application/screens/onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenHeight = MediaQuery.of(context).size.height;
    // final screenWidth = MediaQuery.of(context).size.width;
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnBoarding()),
      );
    });

    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/sportifyLogo.png'),
            fit: BoxFit.cover,
          )),
        ),
      ),
    );
  }
}
