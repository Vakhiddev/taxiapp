import 'package:flutter/material.dart';
import 'package:taxiapp/screens/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xff1E2127),
          appBarTheme: const AppBarTheme(backgroundColor: Color(0xff1E2127))),
      home: const SplashScreen(),
      // home: const OnboardingScreen(),
    );
  }
}
