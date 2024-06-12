import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:taxiapp/bottomSheet/selection_button_sheet.dart';

import 'package:taxiapp/custom_widgets/text_container.dart';
import 'package:taxiapp/theme/colors.dart';

import '../main.dart';
import 'container_button.dart';

int index = 1;
Future serviceButtonSheet(BuildContext context) async {
  await showModalBottomSheet(
    isDismissible: false,
    context: context,
    builder: (BuildContext builderContext) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            height: 280,
            // width: double.maxFinite,
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
                    SvgPicture.asset("assets/icons/icons/line.svg"),
                    const SizedBox(height: 13),
                    addressSelect(
                      width: double.maxFinite,
                      isStartOrFinish: true,
                      address: "Махтумкули, 79",
                    ),
                    const SizedBox(height: 18),
                    SizedBox(
                      height: 82,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          orderCarType(
                              minute: 5,
                              title: "Прикурить",
                              price: "от 25 200 сум",
                              image: "assets/icons/images/accumulate.png",
                              isSelected: index == 1,
                              onPressed: () {
                                setState(() {
                                  index = 1;
                                });
                              }),
                          const SizedBox(width: 12),
                          orderCarType(
                              minute: 5,
                              title: "Перегон авто",
                              price: "от 70 000 сум",
                              image: "assets/icons/images/key.png",
                              isSelected: index == 2,
                              onPressed: () {
                                setState(() {
                                  index = 2;
                                });
                              }),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    rowButtons(
                        title: "Заказать",
                        onTap: () {},
                        onPaymentTap: () {
                          Navigator.pop(context);
                          selectionButtonSheet(
                              context, true, RootType.serviceBSheet);
                        },
                        paymentIcon: "assets/icons/icons/uzcard.svg")
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

Widget addressSelect(
    {required bool isStartOrFinish, required String address, double? width}) {
  return Builder(builder: (context) {
    return Container(
      height: 49,
      width: width ?? screenWidth * 0.82,
      padding: const EdgeInsets.only(left: 14),
      decoration: BoxDecoration(
        border: Border.all(
            color: Theme.of(context).customColor.borderColor, width: 2),
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).customColor.textFieldColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(
            "assets/icons/icons/start_point.svg",
            color: isStartOrFinish
                ? const Color(0xFF32ABE0)
                : const Color(0xFFFFD600),
          ),
          const SizedBox(width: 15),
          TextContainer(
            address,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          if (!isStartOrFinish) const SizedBox(width: 25),
          if (!isStartOrFinish)
            const TextContainer(
              textColor: Color(0xFF979797),
              "8 мин",
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          Spacer(),
        ],
      ),
    );
  });
}

Widget orderCarType({
  required int minute,
  required String title,
  required String price,
  required String image,
  required bool isSelected,
  required VoidCallback onPressed,
}) {
  return Builder(builder: (context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.only(left: 9, top: 12, bottom: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).customColor.containerColor,
          border: Border.all(
              color: isSelected ? const Color(0xFFFFD600) : Colors.white,
              width: 1),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 20,
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                    color: Theme.of(context).customColor.textFieldColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: TextContainer(
                    "$minute мин",
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 2),
                TextContainer(
                  title,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
                const SizedBox(height: 2),
                TextContainer(
                  price,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ],
            ),
            const SizedBox(width: 12),
            Image.asset(image),
          ],
        ),
      ),
    );
  });
}

Widget firstminiContainerButton(
    {required String icon, required VoidCallback onTap}) {
  return Builder(builder: (context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 51,
        height: 51,
        decoration: BoxDecoration(
            color: Theme.of(context).customColor.containerColor,
            borderRadius: BorderRadius.circular(5)),
        child: Center(
            child: SvgPicture.asset(
          icon,
          width: 31,
        )),
      ),
    );
  });
}

Widget secondminiContainerButton(
    {required String icon, required VoidCallback onTap}) {
  return Builder(builder: (context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 51,
        height: 51,
        decoration: BoxDecoration(
            color: Theme.of(context).customColor.containerColor,
            borderRadius: BorderRadius.circular(5)),
        child: Center(
            child: SvgPicture.asset(
          icon,
          color: Theme.of(context).customColor.mainTextColor,
          width: 31,
        )),
      ),
    );
  });
}

Widget rowButtons(
    {required VoidCallback onTap,
    required String title,
    VoidCallback? onPaymentTap,
    VoidCallback? onFilterTap,
    required String paymentIcon}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      firstminiContainerButton(
        icon: paymentIcon,
        onTap: onPaymentTap ?? () {},
      ),
      buttonContainer(
        height: 51,
        width: screenWidth * 0.61,
        fontSize: 16,
        textColor: Colors.black,
        fontWeight: FontWeight.w600,
        containerColor: const Color(0xFFFFD600),
        text: title,
        onTap: onTap,
      ),
      secondminiContainerButton(
        icon: "assets/icons/icons/filter.svg",
        onTap: onFilterTap ?? () {},
      ),
    ],
  );
}
