import 'package:flutter/material.dart';
import 'package:taxiapp/drawer_menu/payment.dart';
import 'package:taxiapp/map/map_screens/yandex_main_screen.dart';
import 'package:taxiapp/map/map_screens/yandex_order.dart';
import 'package:taxiapp/map/map_screens/yandex_service.dart';
import 'package:taxiapp/screens%20copy/orders.dart';
import 'package:taxiapp/screens/splashscreen.dart';

late double screenWidth;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.sizeOf(context).width;
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xff1E2127),
          appBarTheme: const AppBarTheme(backgroundColor: Color(0xff1E2127))),
      home: const SplashScreen(),
      // home: MainYandex(),
      // home: const OnboardingScreen(),
    );
  }
}
