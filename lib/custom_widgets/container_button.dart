
import 'package:flutter/material.dart';
import 'package:taxiapp/custom_widgets/text_container.dart';

Widget buttonContainer({required String text, required Color containerColor,  required Color textColor, VoidCallback? onTap }){
  return  InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(10),
    child: Container(
      height: 65,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: containerColor,
      ),
      child: Center(
        child: TextContainer(text, fontWeight: FontWeight.w600, textColor:  textColor),
      ),
    ),
  );
}
