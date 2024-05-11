import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taxiapp/drawer_menu/payment.dart';

import '../custom_widgets/back_button.dart';
import '../custom_widgets/text_container.dart';
import '../history_payment/history_payment_widget/add_w.dart';
import '../history_payment/history_payment_widget/card.dart';
import '../history_payment/payment_screen.dart';
import '../screens copy/main_screen.dart';

class NewCard extends StatefulWidget {
  const NewCard({super.key});

  @override
  State<NewCard> createState() => _NewCardState();
}

class _NewCardState extends State<NewCard> {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController dueDateController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  backButton(
                    height: height * 0.8,
                    width: width * 0.8,
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Payment()));
                    },
                  ),
                  const TextContainer(
                    "Новая карта",
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 20,
                    width: 48,
                  ),
                ],
              ),
              Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const SizedBox(height: 30),
                      const TextContainer(
                        'Введите номер карты',
                        fontWeight: FontWeight.w300,
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
                            width: MediaQuery.sizeOf(context).width * 0.4,
                            // height: MediaQuery.sizeOf(context).height * 0.2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const TextContainer(
                                  "Срок действия",
                                  fontWeight: FontWeight.w300,
                                ),
                                const SizedBox(height: 9),
                                Padding(
                                  padding: const EdgeInsets.only(right: 32),
                                  child: CustomTextField(
                                    inputType: InputType.dueDate,
                                    controller: dueDateController,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // const SizedBox(width: 8),
                          // Phone Number Field
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const TextContainer(
                                  "Номер телефона",
                                  fontWeight: FontWeight.w300,
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
                            int dueDate =
                                int.parse(dueDateText.replaceAll('/', ''));
                            int phoneNumber =
                                int.parse(phoneNumberText.replaceAll(' ', ''));

                            card.add(
                              CardModel(
                                cardNumber: cardNumber,
                                dueDate: dueDate,
                                phoneNumber: phoneNumber,
                              ),
                            );

                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Карта добавлена успешно")));

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
                            child: const TextContainer(
                              'Добавить карту',
                              fontWeight: FontWeight.w600,
                              textColor: Color(0xFF000000),
                            )),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      )),
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
