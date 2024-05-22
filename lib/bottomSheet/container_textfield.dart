import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';

enum InputType {
  cardNumber,
  phoneNumber,
  dueDate,
  simple,
}

class CustomTextField extends StatefulWidget {
  final int? maxLength;
  final InputType inputType;
  final TextEditingController controller;
  final double? height;
  final String? hintText;
  const CustomTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.height,
    this.maxLength,
    required this.inputType,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: widget.inputType != InputType.simple ? 12 : 4,
          left: widget.inputType == InputType.dueDate
              ? screenWidth * 0.2769 * 0.18
              : widget.inputType != InputType.simple
                  ? 10
                  : 20),
      height: widget.height ?? 60,
      // height: 30,
      decoration: BoxDecoration(
          color: const Color(0xFF26282D),
          borderRadius: BorderRadius.circular(5)),
      child: Stack(
        children: [
          if (widget.inputType == InputType.cardNumber)
            SvgPicture.asset(
              "assets/icons/icons/wallet3.svg",
              width: 24,
              height: 17,
            ),
          const SizedBox(width: 12),
          Padding(
            padding: EdgeInsets.only(
                left: widget.inputType == InputType.cardNumber
                    ? screenWidth * 0.078
                    : widget.inputType == InputType.dueDate
                        ? screenWidth * 0.022
                        : widget.inputType == InputType.phoneNumber
                            ? screenWidth * 0.011
                            : 0,
                top: widget.inputType != InputType.simple ? 5 : 0),
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              maxLength: widget.maxLength,
              controller: widget.controller,
              keyboardType: widget.inputType != InputType.simple
                  ? TextInputType.number
                  : TextInputType.text,
              decoration: InputDecoration(
                  // counterStyle: const TextStyle(height: double.minPositive,),
                  counterText: "",
                  border: InputBorder.none,
                  hintText: widget.hintText ?? '',
                  hintStyle: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      color: Color(0xFFB0B0B0),
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  )),
              maxLines: 1,
              minLines: 1,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
              onChanged: (value) {
                setState(() {
                  print("setstate worked");
                  if (widget.inputType != InputType.simple) {
                    widget.controller.text = formatInput(value);
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  String formatInput(String input) {
    switch (widget.inputType) {
      case InputType.cardNumber:
        return formatCardNumber(input);
      case InputType.phoneNumber:
        return formatPhoneNumber(input);
      case InputType.dueDate:
        return formatDueDate(input);
      default:
        return input;
    }
  }
}

String formatCardNumber(String input) {
  String digitsOnly = input.replaceAll(RegExp(r'[^0-9]'), '');
  String formatted = '';
  for (int i = 0; i < digitsOnly.length; i++) {
    if (i > 0 && i % 4 == 0) {
      formatted += ' ';
    }
    formatted += digitsOnly[i];
  }
  return formatted;
}

String formatDueDate(String input) {
  String digitsOnly = input.replaceAll(RegExp(r'[^0-9]'), '');
  String formatted = '';

  for (int i = 0; i < digitsOnly.length; i++) {
    if (i == 2) {
      formatted += '/';
    }
    formatted += digitsOnly[i];
  }
  return formatted;
}

String formatPhoneNumber(String input) {
  String digitsOnly = input.replaceAll(RegExp(r'[^0-9]'), '');

  if (digitsOnly.startsWith('998')) {
    digitsOnly = digitsOnly.substring(3);
  }
  digitsOnly =
      digitsOnly.substring(0, digitsOnly.length > 9 ? 9 : digitsOnly.length);

  String formatted = digitsOnly.isEmpty ? '' : '+998';

  List<int> spaceIndices = [0, 2, 5, 7, 10];

  for (int i = 0, spaceIndex = 0; i < digitsOnly.length; i++) {
    if (spaceIndex < spaceIndices.length && i == spaceIndices[spaceIndex]) {
      formatted += ' ';
      spaceIndex++;
    }
    formatted += digitsOnly[i];
  }
  return formatted;
}
