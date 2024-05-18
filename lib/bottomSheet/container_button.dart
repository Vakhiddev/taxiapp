import 'package:flutter/material.dart';

import '../custom_widgets/text_container.dart';

Widget buttonContainer(
    {required String text,
    required Color containerColor,
    required Color textColor,
    FontWeight? fontWeight,
    double? height,
    double? width,
    double? fontSize,
    VoidCallback? onTap}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(10),
    child: Container(
      height: height ?? 60,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: containerColor,
      ),
      child: Center(
        child: TextContainer(text,
            fontSize: fontSize ?? 14,
            fontWeight: fontWeight ?? FontWeight.w600,
            textColor: textColor),
      ),
    ),
  );
}
