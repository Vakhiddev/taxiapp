import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../custom_widgets/text_container.dart';

Widget selectionButton(
    {required String title,
    String? icon,
    required bool isOn,
    VoidCallback? onPressed}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      padding: const EdgeInsets.only(left: 12, right: 9),
      width: double.maxFinite,
      height: 49,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color(0xFF23262B),
      ),
      child: Row(
        children: [
          if (icon != null)
            SvgPicture.asset(
              icon,
              width: 24,
              height: 24,
            ),
          const SizedBox(width: 14),
          TextContainer(
            title,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
          const Spacer(),
          SvgPicture.asset(isOn
              ? "assets/icons/selected.svg"
              : "assets/icons/unSelected.svg"),
        ],
      ),
    ),
  );
}
