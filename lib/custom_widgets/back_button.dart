import 'package:flutter/material.dart';
import 'package:taxiapp/theme/colors.dart';

Widget backButton({
  VoidCallback? onTap,
  required double height,
  required double width,
}) {
  return Builder(builder: (context) {
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
                color: Theme.of(context)
                    .customColor
                    .mainBackgroundColor, // Background color
                border: Border.all(
                  width: 1,
                  color: Theme.of(context)
                      .customColor
                      .mainTextColor, // Border color
                ),
              ),
              child: Center(
                child: ImageIcon(
                  AssetImage("assets/icons/vector.png"),
                  color: Theme.of(context).customColor.mainTextColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  });
}
