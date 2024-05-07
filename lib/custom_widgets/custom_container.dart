import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:taxiapp/custom_widgets/text_container.dart';

Widget customContainer({
  required double height,
  required double width,
  required String image,
  required String label,
  VoidCallback? onTap,
}) {
  return Material(
    borderRadius: BorderRadius.circular(30),
    color: const Color.fromRGBO(40, 45, 53, 1),
    child: InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: onTap,
      splashColor: Colors.white.withOpacity(0.3),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(40, 45, 53, 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 6,
              child: Image.asset(image, fit: BoxFit.contain),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: TextContainer(label, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
Widget customContainer2({
  required double height,
  required double width,
  required String image,
  required String label,
  VoidCallback? onTap,
}) {
  return Material(
    borderRadius: BorderRadius.circular(10),
    color: Colors.transparent,
    child: InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      splashColor: Colors.white.withOpacity(0.3),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(40, 45, 53, 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.15 ),
            Expanded(
              flex: 5,
              child: Image.asset(image, fit: BoxFit.contain),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: TextContainer(label, fontSize: 15, fontWeight: FontWeight.w600),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
