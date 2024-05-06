import 'package:flutter/material.dart';
import 'package:healthcare/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'YatraOne',
      ),
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}


