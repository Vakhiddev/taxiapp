import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxiapp/history_payment/history_payment_widget/card.dart';
import 'package:taxiapp/history_payment/payment_screen.dart';

import 'history_payment_widget/add_w.dart';
import 'history_payment_widget/icons.dart';

class AddCardPage extends StatefulWidget {
  const AddCardPage({super.key});

  @override
  _AddCardPageState createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController dueDateController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          forceMaterialTransparency: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(AppIcons.backArrow),
              ),
              const Spacer(),
              const Text(
                "Новая карта",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Color(0xFF292929),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 33),
              const Text(
                "Введите номер карты",
                style: TextStyle(
                  color: Color(0xFF292929),
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 9),
              CustomTextField(
                inputType: InputType.cardNumber,
                controller: cardNumberController,
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  // Due Date Field
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Срок действия",
                          style: TextStyle(
                            color: Color(0xFF292929),
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const SizedBox(height: 9),
                        CustomTextField(
                          inputType: InputType.dueDate,
                          controller: dueDateController,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 19),
                  // Phone Number Field
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Номер телефона",
                          style: TextStyle(
                            color: Color(0xFF292929),
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const SizedBox(height: 9),
                        CustomTextField(
                          inputType: InputType.phoneNumber,
                          controller: phoneNumberController,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              GestureDetector(
                onTap: () {
                  // Validate inputs
                  String cardNumberText = cardNumberController.text;
                  String dueDateText = dueDateController.text;
                  String phoneNumberText = phoneNumberController.text;

                  if (validateCardNumber(cardNumberText) &&
                      validateDueDate(dueDateText) &&
                      validatePhoneNumber(phoneNumberText)) {
                    int cardNumber =
                        int.parse(cardNumberText.replaceAll(' ', ''));
                    int dueDate = int.parse(dueDateText.replaceAll('/', ''));
                    int phoneNumber =
                        int.parse(phoneNumberText.replaceAll(' ', ''));

                    cards.add(
                      CardModel(
                        cardNumber: cardNumber,
                        dueDate: dueDate,
                        phoneNumber: phoneNumber,
                      ),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Карта добавлена успешно")));

                    cardNumberController.clear();
                    dueDateController.clear();
                    phoneNumberController.clear();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Некорректные данные")));
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 51,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xFFFFD600),
                  ),
                  child: const Text(
                    "Добавить карту",
                    style: TextStyle(
                      color: Color(0xFF292929),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool validateCardNumber(String input) {
    String sanitizedInput = input.replaceAll(' ', '');
    if (sanitizedInput.length != 16) {
      return false;
    }
    int? cardNumber = int.tryParse(sanitizedInput);
    return cardNumber != null;
  }

  bool validateDueDate(String input) {
    List<String> parts = input.split('/');
    if (parts.length != 2 || parts[0].length != 2 || parts[1].length != 2) {
      return false;
    }

    int? month = int.tryParse(parts[0]);
    int? year = int.tryParse(parts[1]);

    return month != null && year != null && month >= 1 && month <= 12;
  }

  bool validatePhoneNumber(String input) {
    String sanitizedInput = input.replaceAll(RegExp(r'[^\d]'), '');

    if (sanitizedInput.length != 12) {
      return false;
    }
    int? phoneNumber = int.tryParse(sanitizedInput);
    return phoneNumber != null;
  }
}
