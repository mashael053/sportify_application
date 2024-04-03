import 'package:flutter/material.dart';
import 'package:sportify_application/screens/countries_screen.dart';

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
      home: CountriesScreen(), // Navigate to the CountriesScreen
    );
  }
}