import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../custom_widgets/text_container.dart';
import 'rate_button_sheet.dart';
import 'taxi_cancel_button_sheet.dart';

Future driverInfoButtonSheet(BuildContext context) async {
  await showModalBottomSheet(
    isDismissible: true,
    context: context,
    builder: (BuildContext builderContext) {
      return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        return Container(
          height: double.maxFinite,
          width: double.maxFinite,
          padding: const EdgeInsets.only(left: 18, right: 15),
          decoration: const BoxDecoration(
            color: Color(0xFF1F2126),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: KeyboardDismisser(
            child: Column(
              children: [
                const SizedBox(height: 11),
                SvgPicture.asset("assets/icons/icons/line.svg"),
                const SizedBox(height: 12),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                  
                        driverInfo(avatarPath: "assets/icons/images/driver.png"),
                        const SizedBox(height: 9),
                        whereTo(),
                        const SizedBox(height: 9),
                        tarifAndPrice(),

                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                buttonsRow(context),
                const SizedBox(height: 18),
              ],
            ),
          ),
        );
      });
    },
  );
}

Widget driverInfo({required String avatarPath}) {
  return Container(
    padding: const EdgeInsets.only(left: 15, top: 14, bottom: 14),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: const Color(0xFF282D35),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 65,
          height: 65,
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFF9AD42), width: 1),
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage(avatarPath), fit: BoxFit.cover)),
        ),
        const SizedBox(width: 13),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextContainer(
              "Мирмахмудов Фарход",
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const TextContainer(
                  "4.5",
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
                const SizedBox(width: 3),
                StarRating(
                  height: 12,
                  spacing: 2,
                  rating: 4,
                  onRatingChanged: (rating) {},
                ),
              ],
            ),
            const SizedBox(height: 13),
            const Row(
              children: [
                TextContainer(
                  "01 А ",
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
                TextContainer(
                  "596 ",
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
                TextContainer(
                  "BC",
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ],
            ),
            const SizedBox(height: 3),
            const TextContainer(
              "Белая Gentra",
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ],
        )
      ],
    ),
  );
}

Widget tarifAndPrice() {
  return Container(
    padding: const EdgeInsets.only(left: 14, top: 15, bottom: 15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: const Color(0xFF282D35),
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              "assets/icons/icons/analitic.svg",
            ),
            const SizedBox(width: 15),
            const TextContainer(
              "Тариф ",
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            const TextContainer(
              "Стандарт",
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
        const SizedBox(height: 11),
        Divider(
          thickness: 1,
          color: Colors.white.withOpacity(0.2),
          indent: 37,
          endIndent: 32,
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              "assets/icons/icons/wallet2.svg",
            ),
            const SizedBox(width: 15),
            const TextContainer(
              "4 200 сум, оплата картой",
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      ],
    ),
  );
}

Widget buttonsRow(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      SvgPicture.asset("assets/icons/icons/call.svg"),
      SvgPicture.asset("assets/icons/icons/sms.svg"),
      SvgPicture.asset("assets/icons/icons/close_circle.svg"),
      InkWell(
        onTap: () {
          Navigator.pop(context);
          rateButtonSheet(context, () {});
        },
        child: Container(
          width: 133,
          height: 44,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(200),
              color: const Color(0xFF4CE5B1)),
          child: Row(
            children: [
              const SizedBox(width: 19),
              SvgPicture.asset("assets/icons/icons/black_man.svg"),
              const SizedBox(width: 13),
              const TextContainer(
                textColor: Colors.black,
                "Выхожу",
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              const Spacer(),
            ],
          ),
        ),
      )
    ],
  );
}
