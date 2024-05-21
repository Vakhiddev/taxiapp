import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import 'package:taxiapp/bottomSheet/rate_button_sheet.dart';
import 'package:taxiapp/bottomSheet/taxi_cancel_button_sheet.dart';

import '../custom_widgets/text_container.dart';
import '../main.dart';
import 'container_button.dart';

Future secondCancelButtonSheet(BuildContext context) async {
  await showModalBottomSheet(
    isDismissible: false,
    context: context,
    builder: (BuildContext builderContext) {
      return Container(
        height: 180,
        width: double.maxFinite,
        padding: const EdgeInsets.only(left: 23, right: 20),
        decoration: const BoxDecoration(
          color: Color(0xFF1F2126),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: KeyboardDismisser(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 11),
                SvgPicture.asset("assets/icons/icons/line.svg"),
                const SizedBox(height: 10),
                const TextContainer(
                  textAlign: TextAlign.center,
                  "Вы точно хотите отменить\nваш заказ такси?",
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
                const SizedBox(height: 37),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buttonContainer(
                      height: 51,
                      width: screenWidth * 0.44,
                      fontSize: 16,
                      textColor: Colors.white,
                      fontWeight: FontWeight.w600,
                      containerColor: const Color(0xFF757575),
                      text: "ОТМЕНИТЬ",
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pop(context);

                      },
                    ),
                    buttonContainer(
                      height: 51,
                      width: screenWidth * 0.44,
                      fontSize: 16,
                      textColor: Colors.black,
                      fontWeight: FontWeight.w600,
                      containerColor: const Color(0xFFFFD600),
                      text: "ПОДОЖДАТЬ",
                      onTap: () {
                        Navigator.pop(builderContext);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      );
    },
  );
}
