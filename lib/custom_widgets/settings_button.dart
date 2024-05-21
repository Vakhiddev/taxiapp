import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxiapp/custom_widgets/text_container.dart';

enum ButtonType {
  switchB,
  simpleB,
  selectionB,
}

Widget settingsButton({required ButtonType buttonType, required String title,
  bool? isOn,Function(bool value)? onChanged, VoidCallback? onPressed}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      padding: EdgeInsets.only(
          left: 17, right: buttonType == ButtonType.selectionB ? 7 : 16),
      width: double.maxFinite,
      height: 49,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color(0xFF23262B),
      ),
      child: Row(
        children: [
          TextContainer(
            title,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
          const Spacer(),
          if(buttonType == ButtonType.switchB)
            CustomSwitchButton(
                value: isOn!, onChanged: onChanged),

          if(buttonType == ButtonType.simpleB)
            SvgPicture.asset("assets/icons/icons/small_next.svg"),

          if(buttonType == ButtonType.selectionB)
            SvgPicture.asset(isOn! ?
            "assets/icons/selected.svg" :
            "assets/icons/unselected.svg" ),

        ],
      ),
    ),
  );
}
class CustomSwitchButton extends StatefulWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;

  const CustomSwitchButton({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  _CustomSwitchButtonState createState() => _CustomSwitchButtonState();
}

class _CustomSwitchButtonState extends State<CustomSwitchButton> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    _value = widget.value;
    return GestureDetector(
      onTap: () {
        setState(() {
          _value = !_value;
          widget.onChanged?.call(_value);
        });
      },
      child: SizedBox(
        width: 48,
        height: 22,
        child: Stack(
          children: [
            // Switch track
            Positioned(
              left: 0,
              right: 0,
              top: 2,
              child: Container(
                height: 16,
                decoration: BoxDecoration(
                  color: _value ? Color(0xFFECECEC) : Color(0xFF717171),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            // Switch thumb
            Positioned(
              left: _value ? 27 : 0,
              // top: -2,
              child: Container(
                width: 21,
                height: 21,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFFFD600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}