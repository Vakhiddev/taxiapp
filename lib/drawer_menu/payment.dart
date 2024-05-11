import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxiapp/drawer_menu/new_card.dart';

import '../custom_widgets/back_button.dart';
import '../custom_widgets/text_container.dart';
import '../history_payment/history_payment_widget/card.dart';
import '../history_payment/history_payment_widget/icons.dart';
import '../history_payment/history_payment_widget/select_w.dart';
import '../history_payment/payment_screen.dart';
import '../screens copy/main_screen.dart';

List<CardModel> card = [
  const CardModel(
      cardNumber: 4400010203040506, dueDate: 2216, phoneNumber: 998907580516),
  const CardModel(
      cardNumber: 8600010203040555, dueDate: 2216, phoneNumber: 998907580516)
];

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int? index;
  bool checkMoney = true;
  bool checkCard = true;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                                builder: (context) => const MainScreen()));
                      },
                    ),
                    const TextContainer(
                      "Варианты оплаты",
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => NewCard()));
                      },
                      child: SizedBox(
                        child: SvgPicture.asset(
                          "assets/icons/plus.svg",
                          color: Colors.white,

                          // fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: height * 0.06,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromRGBO(38, 40, 45, 1)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(12.0),
                            child: ImageIcon(
                              AssetImage('assets/icons/Wallet.png'),
                              color: Colors.white,
                            ),
                          ),
                          TextContainer("Наличные"),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              checkMoney = !checkMoney;
                            });
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: checkMoney
                                    ? Colors.yellow
                                    : Colors.grey.shade700,
                              ),
                              color: Colors.transparent,
                            ),
                            child: checkMoney
                                ? const Icon(
                                    Icons.check,
                                    color: Colors.yellow,
                                    size: 16,
                                  )
                                : null,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                ...List.generate(cards.length, (index) {
                  CardModel card = cards[index];
                  return SelectW(
                    onTap: () {
                      this.index = index + 2;
                      setState(() {});
                    },
                    icon: AppIcons.uzcard,
                    title: formatCardNumber(card.cardNumber.toString()),
                    isSelected: this.index == index + 2,
                  );
                }),
                Container(
                  height: height * 0.06,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromRGBO(38, 40, 45, 1)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(12.0),
                            child: SvgPicture.asset(
                              "assets/icons/plus2.svg",
                              color: Colors.white,
                            ),
                          ),
                          TextContainer("Добавить карту"),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: GestureDetector(
                          onTap: () {
                            // setState(() {
                            //   checkCard = !checkCard;
                            // });
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.grey.shade700,
                              ),
                              color: Colors.transparent,
                            ),
                            // child: checkCard
                            //     ? const Icon(
                            //         Icons.check,
                            //         color: Colors.yellow,
                            //         size: 16,
                            //       )
                            //     : null,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String formatCardNumber(String cardNumber) {
    String formattedCardNumber =
        '${cardNumber.substring(0, 4)} **** **** ${cardNumber.substring(12)}';
    return formattedCardNumber;
  }
}
