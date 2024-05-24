import 'package:flutter/material.dart';

import '../custom_widgets/back_button.dart';
import '../custom_widgets/text_container.dart';

class SetLanguage extends StatefulWidget {
  const SetLanguage({super.key});

  @override
  State<SetLanguage> createState() => _SetLanguageState();
}

class _SetLanguageState extends State<SetLanguage> {
  bool checkRu = true;
  bool checkUz = true;
  bool checkEng = true;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    backButton(
                      height: height * 0.8,
                      width: width * 0.8,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    const TextContainer(
                      "Настройки",
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(
                      height: 10,
                      width: 10,
                    ),
                  ],
                ),
                SizedBox(height: height * 0.05),
                SizedBox(height: height * 0.02),
                Container(
                  height: height * 0.07,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromRGBO(38, 40, 45, 1)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextContainer("Русский язык"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              checkRu = !checkRu;
                            });
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: checkRu
                                    ? Colors.yellow
                                    : Colors.grey.shade700,
                              ),
                              color: Colors.transparent,
                            ),
                            child: checkRu
                                ? const Icon(
                                    Icons.check,
                                    color: Colors.yellow,
                                    size: 16,
                                  )
                                : null,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.02),
                Container(
                  height: height * 0.07,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromRGBO(38, 40, 45, 1)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextContainer("English"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              checkEng = !checkEng;
                            });
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: checkEng
                                    ? Colors.yellow
                                    : Colors.grey.shade700,
                              ),
                              color: Colors.transparent,
                            ),
                            child: checkEng
                                ? const Icon(
                                    Icons.check,
                                    color: Colors.yellow,
                                    size: 16,
                                  )
                                : null,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.02),
                Container(
                  height: height * 0.07,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color.fromRGBO(38, 40, 45, 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextContainer("O'zbek tili"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              checkUz = !checkUz;
                            });
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: checkUz
                                    ? Colors.yellow
                                    : Colors.grey.shade700,
                              ),
                              color: Colors.transparent,
                            ),
                            child: checkUz
                                ? const Icon(
                                    Icons.check,
                                    color: Colors.yellow,
                                    size: 16,
                                  )
                                : null,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
