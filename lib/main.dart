import 'package:flutter/material.dart';
import 'package:sportify_application/screens/login_screen.dart';
import 'package:sportify_application/screens/onboarding_screen.dart';
import 'package:sportify_application/screens/players_screen.dart';
import 'package:sportify_application/screens/splash_screen.dart';

String teamkey = "96";
List<Map<String, dynamic>> player = [
  {
    "player_key": 3063582184,
    "player_name": "F. Israel",
    "player_number": "45",
    "player_country": null,
    "player_type": "Goalkeepers",
    "player_age": "21",
    "player_match_played": "0",
    "player_goals": "0",
    "player_yellow_cards": "0",
    "player_red_cards": "0",
    "player_image":
        "https://apiv2.allsportsapi.com/logo/players/79274_f-israel.jpg"
  }
];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}
