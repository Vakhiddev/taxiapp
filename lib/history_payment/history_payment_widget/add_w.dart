import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxiapp/history_payment/history_payment_widget/icons.dart';

enum InputType {
  cardNumber,
  phoneNumber,
  dueDate,
}

class CustomTextField extends StatefulWidget {
  final InputType inputType;
  final TextEditingController controller;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.inputType,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
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

  String formatPhoneNumber(String input) {
    String digitsOnly = input.replaceAll(RegExp(r'[^0-9]'), '');
    String formatted = '+';

    List<int> spaceIndices = [3, 5, 8, 10];

    for (int i = 0, spaceIndex = 0; i < digitsOnly.length; i++) {
      if (spaceIndex < spaceIndices.length && i == spaceIndices[spaceIndex]) {
        formatted += ' ';
        spaceIndex++;
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

  String formatInput(String input) {
    switch (widget.inputType) {
      case InputType.cardNumber:
        return formatCardNumber(input);
      case InputType.phoneNumber:
        return formatPhoneNumber(input);
      case InputType.dueDate:
        return formatDueDate(input);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      height: 40,
      decoration: BoxDecoration(
          color: const Color(0xFF26282D),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          if (widget.inputType == InputType.cardNumber)
            SvgPicture.asset(
              AppIcons.card,
              width: 24,
              height: 24,
              color: Colors.white,
            ),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: widget.controller,
              keyboardType: TextInputType.number,
              decoration: null,
              maxLines: 1,
              minLines: 1,
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  color: Colors.white,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  widget.controller.text = formatInput(value);
                  widget.controller.selection = TextSelection.fromPosition(
                    TextPosition(offset: widget.controller.text.length),
                  );
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
