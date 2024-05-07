import 'package:flutter/material.dart';
import 'package:taxiapp/custom_widgets/text_container.dart';

Widget serviceButtons({
  required double height,
  required double width,
  required String info,
  required String image,
  VoidCallback? onTap,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
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
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromRGBO(40, 45, 53, 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: TextContainer(info)
                  ),
                ],
              ),
              const Spacer(),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover, // Adjust the fit as per your requirement
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
