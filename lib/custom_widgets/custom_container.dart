import 'package:flutter/material.dart';

Widget customContainer({
  required double height,
  required double width,
  required String image,
  required String label,
  VoidCallback? onTap,
}) {
  return Material(
    borderRadius: BorderRadius.circular(30),
    color: Colors.transparent,
    child: InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: onTap,
      splashColor: Colors.white.withOpacity(0.3),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Expanded(
              flex: 3,
              child: Image.asset(image, fit: BoxFit.contain),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
