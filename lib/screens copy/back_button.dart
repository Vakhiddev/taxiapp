
import 'package:flutter/material.dart';

Widget backButton({
  VoidCallback? onTap,
  required double height,
  required double width,
}) {
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 5),
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