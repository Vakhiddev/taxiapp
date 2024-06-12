import 'package:flutter/material.dart';

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  final Color mainBackgroundColor;
  final Color containerColor;
  final Color secondContainerColor;
  final Color mainTextColor;
  final Color languageButtonColor;
  final Color secondTextColor;
  final Color thirdTextColor;
  final Color textFieldColor;
  final Color buttonSheetColor;
  final Color borderColor;
  final Color fourthTextColor;
  const CustomColors({
    required this.mainBackgroundColor,
    required this.containerColor,
    required this.secondContainerColor,
    required this.mainTextColor,
    required this.languageButtonColor,
    required this.secondTextColor,
    required this.thirdTextColor,
    required this.textFieldColor,
    required this.buttonSheetColor,
    required this.borderColor,
    required this.fourthTextColor,
  });

  @override
  CustomColors copyWith({
    Color? mainBackgroundColor,
    Color? containerColor,
    Color? secondContainerColor,
    Color? mainTextColor,
    Color? languageButtonColor,
    Color? secondTextColor,
    Color? thirdTextColor,
    Color? textFieldColor,
    Color? buttonSheetColor,
    Color? borderColor,
    Color? dividerColor,
  }) {
    return CustomColors(
      mainBackgroundColor: mainBackgroundColor ?? this.mainBackgroundColor,
      containerColor: containerColor ?? this.containerColor,
      secondContainerColor: secondContainerColor ?? this.secondContainerColor,
      mainTextColor: mainTextColor ?? this.mainTextColor,
      languageButtonColor: languageButtonColor ?? this.languageButtonColor,
      secondTextColor: secondTextColor ?? this.secondTextColor,
      thirdTextColor: thirdTextColor ?? this.thirdTextColor,
      textFieldColor: textFieldColor ?? this.textFieldColor,
      buttonSheetColor: buttonSheetColor ?? this.buttonSheetColor,
      borderColor: borderColor ?? this.borderColor,
      fourthTextColor: dividerColor ?? this.fourthTextColor,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      mainBackgroundColor:
          Color.lerp(mainBackgroundColor, other.mainBackgroundColor, t)!,
      containerColor: Color.lerp(containerColor, other.containerColor, t)!,
      secondContainerColor:
          Color.lerp(secondContainerColor, other.secondContainerColor, t)!,
      mainTextColor: Color.lerp(mainTextColor, other.mainTextColor, t)!,
      languageButtonColor:
          Color.lerp(languageButtonColor, other.languageButtonColor, t)!,
      secondTextColor: Color.lerp(secondTextColor, other.secondTextColor, t)!,
      thirdTextColor: Color.lerp(thirdTextColor, other.thirdTextColor, t)!,
      textFieldColor: Color.lerp(textFieldColor, other.textFieldColor, t)!,
      buttonSheetColor:
          Color.lerp(buttonSheetColor, other.buttonSheetColor, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      fourthTextColor: Color.lerp(fourthTextColor, other.fourthTextColor, t)!,
    );
  }
}

extension CustomColorsExtension on ThemeData {
  CustomColors get customColor {
    return extension<CustomColors>()!;
  }
}
