import 'package:flutter/material.dart';

import '../custom_widgets/back_button.dart';
import '../custom_widgets/settings_button.dart';
import '../custom_widgets/text_container.dart';
import '../main.dart';

class SettingsLanguagesScreen extends StatefulWidget {
  const SettingsLanguagesScreen({super.key});

  @override
  State<SettingsLanguagesScreen> createState() =>
      _SettingsLanguagesScreenState();
}

class _SettingsLanguagesScreenState extends State<SettingsLanguagesScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                backButton(
                    height: screenHeight,
                    width: screenWidth,
                    onTap: () {
                      Navigator.pop(context);
                    }),
                SizedBox(width: screenWidth * 0.1923),
                const TextContainer(
                  "Выбор языка",
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ],
            ),
            const SizedBox(height: 32),
            settingsButton(
              isOn: index == 0,
              onPressed: () {
                index = 0;
                setState(() {});
              },
              buttonType: ButtonType.selectionB,
              title: "Русский язык",
            ),
            const SizedBox(height: 9),
            settingsButton(
              isOn: index == 1,
              onPressed: () {
                setState(() {
                  index = 1;
                });
              },
              buttonType: ButtonType.selectionB,
              title: "English",
            ),
            const SizedBox(height: 9),
            settingsButton(
              isOn: index == 2,
              onPressed: () {
                index = 2;
                setState(() {});
              },
              buttonType: ButtonType.selectionB,
              title: "O’zbek tili",
            ),
          ],
        ),
      ),
    ));
  }
}
