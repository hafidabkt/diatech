import 'package:flutter/material.dart';
import 'package:healthcare/screens/onboard.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:healthcare/screens/welcome_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:healthcare/screens/consts.dart';
import 'screens/configure.dart';

Future main() async {
  await configureApp();
  Gemini.init(
  apiKey: Gemini_Api_key,
  );
  runApp(MyApp());
}

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'YatraOne',
      ),
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: scaffoldMessengerKey,
      home: OnboardScreen(),
    );
  }
}