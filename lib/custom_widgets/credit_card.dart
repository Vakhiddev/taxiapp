import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taxiapp/custom_widgets/text_container.dart';

Widget customCard({required String image,required double height, required String cardNumber, VoidCallback? onTap}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: InkWell(
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromRGBO(40, 45, 53, 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 28),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: SizedBox(
                          child: Image.asset("assets/images/uz_card.png"),
                        ),
                      ),
                    ),
                  ),
                  const TextContainer(
                    "4455 **** **** 4331",
                    fontWeight: FontWeight.w600,
                  ),
                   SizedBox(width: height*0.12),
                  GestureDetector(
                      onTap: onTap,
                      child: SvgPicture.asset("assets/icons/right.svg"))
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}