import 'package:flutter/material.dart';
import 'package:taxiapp/custom_widgets/text_container.dart';
import 'package:taxiapp/screens%20copy/auth_screen.dart';
import 'package:taxiapp/screens%20copy/main_screen.dart';

import 'back_button.dart';

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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                backButton(height: height, width: width, onTap: () {}),

                SizedBox(height: height * 0.12),

                const TextContainer(
                  "Выберите язык",
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: height * 0.012),
                const TextContainer(
                  "Пожалуйста, выберите язык\nинтерфейса для приложения",
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(height: height * 0.025),
                languageButton(
                    title: "Русский язык",
                    image: "assets/images/flag_ru.png",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AuthScreen(),
                        ),
                      );
                    }),
                languageButton(
                    title: "O'zbek tili",
                    image: "assets/images/flag_uzb.png",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AuthScreen(),
                        ),
                      );
                    }),
                languageButton(
                    title: "English",
                    image: "assets/images/flag_eng.png",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AuthScreen(),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


Widget languageButton(
    {required String title, required String image, VoidCallback? onPressed}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: MaterialButton(
      color: const Color.fromRGBO(40, 45, 53, 1),
      height: 60,
      minWidth: double.infinity,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 45,
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextContainer(title),
          )
        ],
      ),
    ),
  );
}
