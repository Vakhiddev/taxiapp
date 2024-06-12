import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFF0F0F0),
    appBarTheme: const AppBarTheme(backgroundColor: Color(0xFFF0F0F0)),
    extensions: [
      CustomColors(
          mainBackgroundColor: const Color(0xFFF0F0F0),
          containerColor: const Color(0xFFFFFFFF),
          secondContainerColor: const Color(0xFFD8D9DB),
          mainTextColor: const Color(0xFF292929),
          languageButtonColor: Colors.white,
          secondTextColor: const Color(0xFF292929),
          thirdTextColor: const Color(0xFF000000),
          textFieldColor: Color(0xFF000000).withOpacity(0.02),
          buttonSheetColor: const Color(0xFFF0F0F0),
          borderColor: const Color(0xFFFFFFFF),
          fourthTextColor: const Color(0xFF000000)),
    ]);
