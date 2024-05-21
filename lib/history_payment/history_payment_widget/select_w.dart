import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxiapp/custom_widgets/text_container.dart';
import 'package:taxiapp/main.dart';

class SelectW extends StatelessWidget {
  final String icon;
  final String title;
  final bool isSelected;
  final Function() onTap;
  const SelectW({
    super.key,
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Container(
          padding: const EdgeInsets.only(
            left: 12,
            right: 9,
          ),
          height: screenHeight * 0.06,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromRGBO(38, 40, 45, 1)),

          child: Row(
            children: [
              SvgPicture.asset(icon,height: 24,),
              const SizedBox(width: 16),
              TextContainer(
                title,
                fontSize: 16,
              ),
              const Spacer(),
              SvgPicture.asset(
                  isSelected ? "assets/icons/icons/selected.svg":"assets/icons/icons/unSelected.svg"),
            ],
          ),
        ),
      ),
    );
  }
}
