import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../custom_widgets/text_container.dart';
import 'container_button.dart';
import 'container_textfield.dart';

TextEditingController numberController = TextEditingController();
TextEditingController dateController = TextEditingController();
TextEditingController phoneNumberController = TextEditingController();

Future addCardButtonSheet(BuildContext context) async {
  await showModalBottomSheet(
    isDismissible: false,
    context: context,
    builder: (BuildContext builderContext) {
      return Container(
        height: 265,
        width: double.maxFinite,
        padding: const EdgeInsets.only(left: 23, right: 20),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 11),
                Center(child: SvgPicture.asset("assets/icons/icons/line.svg")),
                const SizedBox(height: 12),

                const TextContainer(
                  "Введите номер карты",
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                ),
                const SizedBox(height: 9),
                CustomTextField(
                    maxLength: 19,
                    height: 40,
                    controller: numberController,
                    inputType: InputType.cardNumber),
                const SizedBox(height: 14),
                Row(
                  children: [
                    SizedBox(
                      width: 115,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TextContainer(
                            "Срок действия",
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                          ),
                          const SizedBox(height: 9),
                          CustomTextField(
                            maxLength: 5,
                            height: 40,
                            controller: dateController,
                            inputType: InputType.dueDate,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 23),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TextContainer(
                            "Номер телефона",
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                          ),
                          const SizedBox(height: 9),
                          CustomTextField(
                            maxLength: 17,
                            height: 40,
                            controller: phoneNumberController,
                            inputType: InputType.phoneNumber,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                buttonContainer(
                  height: 51,
                  fontSize: 16,
                  textColor: Colors.white,
                  fontWeight: FontWeight.w600,
                  containerColor: const Color(0xFF757575),
                  text: "Добавить карту",
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      );
    },
  );
}
