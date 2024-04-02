import 'package:flutter/material.dart';
import 'package:sportify_application/screens/Data/models/league_model.dart';
import 'package:sportify_application/screens/Data/repositories/League_api_service.dart';
import 'package:sportify_application/screens/leagues_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sportify Application',
      theme: ThemeData(
        primaryColor: Color(0xFFA1C398),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LeaguesScreen(),
    );
  }
}
