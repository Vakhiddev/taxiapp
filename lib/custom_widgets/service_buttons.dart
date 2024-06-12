import 'package:flutter/material.dart';
import 'package:taxiapp/custom_widgets/text_container.dart';
import 'package:taxiapp/theme/colors.dart';

Widget serviceButtons({
  required double height,
  required double width,
  required String info,
  required String image,
  required bool isSelected,
  VoidCallback? onTap,
}) {
  return Builder(builder: (context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.5),
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
              border: Border.all(
                  color: isSelected
                      ? const Color(0xFFFFD600)
                      : Theme.of(context).customColor.mainBackgroundColor,
                  width: 1),
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).customColor.containerColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 10),
                        child: TextContainer(
                          info,
                          fontWeight: FontWeight.w500,
                        )),
                  ],
                ),
                const Spacer(),
                Expanded(
                  flex: 5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      image,
                      fit: BoxFit
                          .cover, // Adjust the fit as per your requirement
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  });
}
