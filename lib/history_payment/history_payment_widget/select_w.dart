import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxiapp/custom_widgets/text_container.dart';
import 'package:taxiapp/history_payment/history_payment_widget/icons.dart';

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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Container(
          // margin: const EdgeInsets.only(left: 19, right: 19, bottom: 9),
          padding: const EdgeInsets.only(
            left: 12,
            right: 9,
          ),
          height: height * 0.06,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromRGBO(38, 40, 45, 1)),

          child: Row(
            children: [
              SvgPicture.asset(icon),
              const SizedBox(width: 16),
              TextContainer(
                title,
                fontSize: 16,
              ),
              const Spacer(),
              SvgPicture.asset(
                  // color: const Color.fromRGBO(38, 40, 45, 1),
                  isSelected ? AppIcons.selected : AppIcons.unselected),
            ],
          ),
        ),
      ),
    );
  }
}
