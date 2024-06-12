import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taxiapp/screens%20copy/auth_screen.dart';
import 'package:taxiapp/screens%20copy/main_screen.dart';
import 'package:taxiapp/screens/splashscreen.dart';

import 'theme/theme_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ThemeNotifier themeNotifier = ThemeNotifier();
  await themeNotifier.loadThemePreference();

  runApp(
    ChangeNotifierProvider(
      create: (_) => themeNotifier,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    screenHeight = height;
    double width = MediaQuery.of(context).size.width;
    screenWidth = width;
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: true,
            theme: themeNotifier.currentTheme,
            home: SplashScreen()
            // home: AuthScreen(),
            // home: MainScreen(),
            );
      },
    );
  }
}

late double screenWidth;
late double screenHeight;
