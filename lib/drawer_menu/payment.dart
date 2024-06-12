import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxiapp/drawer_menu/new_card.dart';
import 'package:taxiapp/theme/colors.dart';

import '../custom_widgets/back_button.dart';
import '../custom_widgets/text_container.dart';
import '../history_payment/history_payment_widget/card.dart';
import '../history_payment/history_payment_widget/select_w.dart';
import '../screens copy/main_screen.dart';

List<CardModel> cards = [
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
                      height: height * 0.75,
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddCardScreen()));
                      },
                      child: SizedBox(
                        child: SvgPicture.asset(
                          "assets/icons/plus.svg",
                          color: Theme.of(context).customColor.mainTextColor,

                          // fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                SelectW(
                  icon: "assets/icons/icons/wallet2.svg",
                  title: "Наличные",
                  isSelected: index == 1,
                  onTap: () {
                    setState(() {
                      index = 1;
                    });
                  },
                ),
                ...List.generate(cards.length, (index) {
                  CardModel card = cards[index];
                  return SelectW(
                    onTap: () {
                      this.index = index + 2;
                      setState(() {});
                    },
                    icon: "assets/icons/icons/uzcard.svg",
                    title: formatCardNumber(card.cardNumber.toString()),
                    isSelected: this.index == index + 2,
                  );
                }),
                SelectW(
                  icon: "assets/icons/plus2.svg",
                  title: "Добавить карту",
                  isSelected: index == 4,
                  onTap: () async {
                    setState(() {
                      index = 4;
                    });
                    await Future.delayed(Duration(seconds: 1));
                    setState(() {
                      index = 1;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddCardScreen()));
                  },
                )
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
