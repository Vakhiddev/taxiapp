import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taxiapp/screens%20copy/home.dart';
import 'package:taxiapp/screens%20copy/main_screen.dart';
import 'package:taxiapp/theme/colors.dart';
import '../custom_widgets/back_button.dart';
import '../custom_widgets/settings_button.dart';
import '../custom_widgets/text_container.dart';
import '../main.dart';
import '../screens copy/select_language_settings.dart';
import '../theme/theme_notifier.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isOn = true;
  @override
  Widget build(BuildContext context) {
    bool isLightTheme = Theme.of(context).brightness != Brightness.light;
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                backButton(
                    height: screenHeight,
                    width: screenWidth,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainScreen(),
                        ),
                      );
                    }),
                SizedBox(
                  width: screenWidth * 0.20,
                ),
                TextContainer(
                  "Настройки",
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ],
            ),
            const SizedBox(height: 33),
            settingsButton(
                isOn: isLightTheme,
                buttonType: ButtonType.switchB,
                title: "Включить ночной режим",
                onChanged: (value) {
                  setState(() {
                    isLightTheme = value;
                  });
                  Provider.of<ThemeNotifier>(context, listen: false)
                      .toggleTheme();
                }),
            const SizedBox(height: 9),
            settingsButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsLanguagesScreen()));
              },
              buttonType: ButtonType.simpleB,
              title: "Русский язык",
            ),
          ],
        ),
      ),
    ));
  }
}
