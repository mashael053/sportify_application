 import 'package:flutter/material.dart';
 import 'package:sportify_application/screens/leagues_screen.dart';
 void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LeaguesScreen(countryKey: '',), // Navigate to the CountriesScreen
    );
  }
}


// import 'package:flutter/material.dart';
// <<<<<<< HEAD
// import 'package:sportify_application/screens/countries_screen.dart';
// =======
// import 'package:sportify_application/screens/login_screen.dart';
// import 'package:sportify_application/screens/onboarding_screen.dart';
// import 'package:sportify_application/screens/splash_screen.dart';
// >>>>>>> 7e95db21c54b99df7ad6392188370d38684ff8fb

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
// <<<<<<< HEAD
//     return MaterialApp(
//       title: 'My App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: CountriesScreen(), // Navigate to the CountriesScreen
//     );
//   }
// }
// =======
//     return SplashScreen();
//   }
// }
// >>>>>>> 7e95db21c54b99df7ad6392188370d38684ff8fb
