import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:taxiapp/bottomSheet/driver_info_button_sheet.dart';
import 'package:taxiapp/bottomSheet/second_cancel_button_sheet.dart';
import 'package:taxiapp/custom_widgets/text_container.dart';

int index = 1;

Future taxiCancelButtonSheet(BuildContext context) async {
  await showModalBottomSheet(
    isDismissible: true,
    context: context,
    builder: (BuildContext builderContext) {
      return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            Future.delayed(Duration(seconds: 3), () {
              Navigator.pop(context);
              Navigator.maybePop(builderContext);
              driverInfoButtonSheet(context);
            });
        return Container(
          height: 217,
          width: double.maxFinite,
          padding: const EdgeInsets.only(
            left: 14,
            right: 19,
          ),
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
                  SvgPicture.asset("assets/icons/icons/line.svg"),
                  const SizedBox(height: 14),
                    whereTo(),
                  const SizedBox(height: 15),
                  InkWell(
                    onTap: () {
                      // Navigator.pop(context);
                      secondCancelButtonSheet(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/icons/icons/cancel.svg"),
                        const SizedBox(width: 17),
                        const TextContainer(
                          "Отменить заказ",
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      });
    },
  );
}

Widget whereTo() {
  return Container(
    padding: const EdgeInsets.only(left: 14, top: 15, bottom: 15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: const Color(0xFF282D35),
    ),
    child: Column(
      children: [
        addressMini(isStartOrFinish: true, address: "Махтумкули, 79"),
        const SizedBox(height: 11),
        Divider(
          thickness: 1,
          color: Colors.white.withOpacity(0.2),
          indent: 37,
          endIndent: 32,
        ),
        const SizedBox(height: 10),
        addressMini(isStartOrFinish: false, address: "Домой"),
      ],
    ),
  );
}

Widget addressMini({
  required bool isStartOrFinish,
  required String address,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SvgPicture.asset(
        "assets/icons/icons/start_point.svg",
        color:
            isStartOrFinish ? const Color(0xFF32ABE0) : const Color(0xFFFFD600),
      ),
      const SizedBox(width: 15),
      InkWell(
        child: TextContainer(
          address,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
      if (!isStartOrFinish) const SizedBox(width: 25),
    ],
  );
}
