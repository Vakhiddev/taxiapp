import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:taxiapp/custom_widgets/text_container.dart';
import 'package:taxiapp/screens%20copy/main_screen.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            backButton(height: height, width: width, onTap: () {}),
            SizedBox(height: height * 0.2),
            const TextContainer(
              "Выбирать язык",
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: height * 0.01),
            const TextContainer(
              "Пожалуйста, выберите язык\nинтерфейса для приложения",
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
            SizedBox(height: height * 0.01),
            languageCard(
                imageName: "assets/images/flag_ru.png",
                langType: "Русский язык",
                height: height,
                width: width,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainScreen()));
                }),
            SizedBox(height: height * 0.01),

            languageCard(
                imageName: "assets/images/flag_uzb.png",
                langType: "O'zbek tili",
                height: height,
                width: width,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainScreen()));
                }),
            SizedBox(height: height * 0.01),

            languageCard(
                imageName: "assets/images/flag_eng.png",
                langType: "English",
                height: height,
                width: width,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainScreen()));
                }),
          ],
        ),
      )),
    );
  }
}

Widget languageCard({
  required String imageName,
  required String langType,
  required double height,
  required double width,
  VoidCallback? onTap,
}) {
  return Material(
    borderRadius: BorderRadius.circular(10), // Set border radius for Material widget
    clipBehavior: Clip.antiAlias, // Ensure the splash color respects the border radius
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10), // Set border radius for InkWell
      splashColor: Colors.white.withOpacity(0.3), // Set splash color
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(40, 45, 53, 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: Container(
            height: height * 0.1,
            width: width * 0.15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              margin: const EdgeInsets.all(5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                // Adjusted to keep 5px distance from the container border
                child: Image.asset(
                  imageName,
                  fit: BoxFit.cover, // Adjust the fit as per your requirement
                ),
              ),
            ),
          ),
          title: Text(langType),
        ),
      ),
    ),
  );
}




Widget backButton({
  VoidCallback? onTap,
  required double height,
  required double width,
}) {
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.all(25),
        child: InkWell(
          onTap: onTap,
          child: Container(
            height: height * 0.06,
            width: width * 0.12,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromRGBO(30, 33, 39, 1), // Background color
              border: Border.all(
                color: Colors.grey, // Border color
              ),
            ),
            child: const Center(
              child: ImageIcon(
                AssetImage("assets/icons/vector.png"),
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
