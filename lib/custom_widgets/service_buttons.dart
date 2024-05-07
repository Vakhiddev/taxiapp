import 'package:flutter/material.dart';

Widget serviceButtons({
  required double height,
  required double width,
  required String info,
  required String image,
  VoidCallback? onTap,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Material(
      borderRadius: BorderRadius.circular(15),
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onTap,
        splashColor: Colors.white.withOpacity(0.3),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  info,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const Spacer(),
              Image.asset(image),
            ],
          ),
        ),
      ),
    ),
  );
}
