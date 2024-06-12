import 'package:flutter/material.dart';
import 'package:taxiapp/theme/colors.dart';

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xff1E2127),
    appBarTheme: const AppBarTheme(backgroundColor: Color(0xff1E2127)),
    extensions: [
      CustomColors(
          mainBackgroundColor: const Color(0xFF1E2127),
          containerColor: const Color(0xFF23262B),
          secondContainerColor: const Color(0xFF23262B),
          mainTextColor: Colors.white,
          languageButtonColor: const Color(0xFF27282A),
          secondTextColor: const Color(0xFFD5D5D5),
          thirdTextColor: const Color(0xFFF0C75D),
          textFieldColor: const Color(0xFF26282D),
          buttonSheetColor: const Color(0xFF1F2126),
          borderColor: const Color(0xFF23262B),
          fourthTextColor: const Color(0xFFFFFFFF)),
    ]);
