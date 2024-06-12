import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taxiapp/custom_widgets/text_container.dart';
import 'package:taxiapp/theme/colors.dart';

Widget orderCard(
    {required double height,
    required double width,
    required String time,
    required String street,
    required String home,
    required String user,
    required String payment}) {
  return Builder(builder: (context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: height * 0.35,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
              width: 1, color: Theme.of(context).customColor.borderColor),
          color: Theme.of(context).customColor.textFieldColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: height * 0.06,
                  child: TextContainer(
                    time,
                    fontWeight: FontWeight.w700,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.circle_outlined,
                    color: Colors.blue,
                    size: 15,
                  ),
                  SizedBox(width: width * 0.06),
                  Expanded(
                    child: TextContainer(
                      street,
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.10, right: width * 0.05),
                child: Divider(
                  color: Theme.of(context).customColor.mainBackgroundColor,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.circle_outlined,
                    color: Colors.yellow,
                    size: 15,
                  ),
                  SizedBox(width: width * 0.06),
                  Expanded(
                    child: TextContainer(
                      home,
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.10, right: width * 0.05),
                child: Divider(
                  color: Theme.of(context).customColor.mainBackgroundColor,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                      height: 24,
                      width: 24,
                      child: SvgPicture.asset(
                        "assets/icons/person.svg",
                        color: Theme.of(context).customColor.mainTextColor,
                      )),
                  SizedBox(width: width * 0.04),
                  Expanded(
                    child: TextContainer(
                      user,
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.10, right: width * 0.05),
                child: Divider(
                  color: Theme.of(context).customColor.mainBackgroundColor,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                      height: 24,
                      width: 24,
                      child: ImageIcon(
                        AssetImage("assets/icons/Wallet.png"),
                        color: Theme.of(context).customColor.mainTextColor,
                      )),
                  SizedBox(width: width * 0.04),
                  Expanded(
                    child: TextContainer(
                      payment,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  });
}
