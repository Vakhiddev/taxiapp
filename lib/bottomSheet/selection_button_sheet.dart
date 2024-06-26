import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:taxiapp/bottomSheet/settings_button.dart';
import 'package:taxiapp/theme/colors.dart';

import 'add_card_button_sheet.dart';
import 'gazel_second_button_sheet.dart';

int index = 1;
int index2 = 1;

enum RootType { serviceBSheet, taxiBSheet, gazelBSheet, gazel2BSheet, none }

Future selectionButtonSheet(
    BuildContext context, bool isPaymentOrChance, RootType rootType) async {
  await showModalBottomSheet(
    isDismissible: true,
    context: context,
    builder: (BuildContext builderContext) {
      return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        return Container(
          width: double.maxFinite,
          padding: const EdgeInsets.only(left: 17, right: 20, bottom: 26),
          decoration: BoxDecoration(
            color: Theme.of(context).customColor.mainBackgroundColor,
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
                  SvgPicture.asset(
                    "assets/icons/icons/line.svg",
                    color: Theme.of(context).customColor.mainTextColor,
                  ),
                  const SizedBox(height: 20),
                  if (isPaymentOrChance == true)
                    Column(
                      children: [
                        selectionButton(
                          icon: "assets/icons/icons/wallet2.svg",
                          onPressed: () {
                            setState(() {
                              Navigator.pop(context);
                              index = 1;
                              // rootType == RootType.serviceBSheet ?
                              //     serviceButtonSheet(context) :
                              // rootType == RootType.taxiBSheet ?
                              // taxiButtonSheet(context) :
                              // rootType == RootType.gazelBSheet ?
                              //     gazelButtonSheet(context) : rootType == RootType.gazelBSheet ?
                              rootType == RootType.gazel2BSheet
                                  ? gazelSecondButtonSheet(context)
                                  : null;
                            });
                          },
                          isOn: index == 1,
                          title: "Наличные",
                        ),
                        const SizedBox(height: 9),
                        selectionButton(
                          icon: "assets/icons/icons/uzcard.svg",
                          onPressed: () {
                            Navigator.pop(context);
                            setState(() {
                              index = 2;
                              // rootType == RootType.serviceBSheet ?
                              //     null:
                              // // serviceButtonSheet(context) :
                              // rootType == RootType.taxiBSheet ?
                              // taxiButtonSheet(context) :
                              // rootType == RootType.gazelBSheet ?
                              // gazelButtonSheet(context) : rootType == RootType.gazelBSheet ?
                              // gazelSecondButtonSheet(context) : null;
                              rootType == RootType.gazel2BSheet
                                  ? gazelSecondButtonSheet(context)
                                  : null;
                            });
                          },
                          isOn: index == 2,
                          title: "4455 **** **** 4331",
                        ),
                        const SizedBox(height: 9),
                        selectionButton(
                          icon: "assets/icons/icons/add.svg",
                          onPressed: () {
                            setState(() {
                              index = 3;
                              addCardButtonSheet(context);
                            });
                          },
                          isOn: index == 3,
                          title: "Добавить карту",
                        ),
                      ],
                    ),
                  if (isPaymentOrChance == false)
                    Column(
                      children: [
                        selectionButton(
                          icon: "assets/icons/icons/cooller.svg",
                          onPressed: () {
                            setState(() {
                              Navigator.pop(context);
                              index2 = 1;
                              // rootType == RootType.serviceBSheet ?
                              // serviceButtonSheet(context) :
                              // rootType == RootType.taxiBSheet ?
                              // taxiButtonSheet(context) :
                              // rootType == RootType.gazelBSheet ?
                              // gazelButtonSheet(context) :
                              // gazelSecondButtonSheet(context);
                            });
                          },
                          isOn: index2 == 1,
                          title: "Кондиционер",
                        ),
                        const SizedBox(height: 9),
                        selectionButton(
                          icon: "assets/icons/icons/cat.svg",
                          onPressed: () {
                            setState(() {
                              Navigator.pop(context);
                              index2 = 2;
                              // rootType == RootType.serviceBSheet ?
                              // serviceButtonSheet(context) :
                              // rootType == RootType.taxiBSheet ?
                              // taxiButtonSheet(context) :
                              // rootType == RootType.gazelBSheet ?
                              // gazelButtonSheet(context) :
                              // gazelSecondButtonSheet(context);
                            });
                          },
                          isOn: index2 == 2,
                          title: "Перевозка питомца",
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        );
      });
    },
  );
}
