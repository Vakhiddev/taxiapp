import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:taxiapp/bottomSheet/settings_button.dart';

import '../custom_widgets/text_container.dart';
import 'service_button_sheet.dart';

int index = 1;
Future gazelSecondButtonSheet(BuildContext context) async {
  await showModalBottomSheet(
    isDismissible: true,
    context: context,
    builder: (BuildContext builderContext) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            height: 410,
            width: double.maxFinite,
            padding: const EdgeInsets.only(left: 17, right: 15, bottom: 20),
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
                    const SizedBox(height: 13),
                    SvgPicture.asset("assets/icons/line.svg"),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/gazel2.png",
                          width: 210,
                          height: 100,
                        ),
                        const SizedBox(
                          width: 34,
                        ),
                        const Column(
                          children: [
                            TextContainer(
                              "Газель",
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                            TextContainer(
                              "от 25 200 сум",
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 18),
                    selectionButton(
                        title: "До 300 кг, бортовая Газель",
                        isOn: index == 1,
                        onPressed: () {
                          setState(() {
                            index = 1;
                          });
                        }),
                    const SizedBox(height: 9),
                    selectionButton(
                        title: "До 700 кг, 7м кузов",
                        isOn: index == 2,
                        onPressed: () {
                          setState(() {
                            index = 2;
                          });
                        }),
                    const SizedBox(height: 9),
                    selectionButton(
                        title: "До 1 400 кг, 9м кузов",
                        isOn: index == 3,
                        onPressed: () {
                          setState(() {
                            index = 3;
                          });
                        }),
                    const SizedBox(height: 19),
                    rowButtons(
                        title: "Уточнить габариты",
                        onTap: () {},
                        paymentIcon: "assets/icons/uzcard.svg")
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
