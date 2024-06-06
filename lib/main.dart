import 'package:flutter/material.dart';
import 'package:healthcare/screens/onboard.dart';
import 'package:healthcare/screens/welcome_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'configure.dart';

Future main() async {
  await configureApp();
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
      home: WelcomeScreen(),
    );
  }
}