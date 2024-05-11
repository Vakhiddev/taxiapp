import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxiapp/history_payment/add_card.dart';
import 'package:taxiapp/history_payment/history_payment_widget/card.dart';
import 'package:taxiapp/history_payment/history_payment_widget/icons.dart';
import 'package:taxiapp/history_payment/history_payment_widget/select_w.dart';

List<CardModel> cards = [
  CardModel(
      cardNumber: 4400010203040506, dueDate: 2216, phoneNumber: 998907580516),
  CardModel(
      cardNumber: 8600010203040555, dueDate: 2216, phoneNumber: 998907580516)
];

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int? index;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // forceMaterialTransparency: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  //hozircha orqada screen mavjud emas
                },
                child: SvgPicture.asset(AppIcons.backArrow),
              ),
              const Text(
                "Варианты оплаты",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color(0xFFFFFFFF)),
              ),
              GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(AppIcons.plus),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            const SizedBox(height: 33),
            SelectW(
              onTap: () {
                index = 1;
                setState(() {});
              },
              icon: AppIcons.wallet,
              title: "Наличные",
              isSelected: index == 1,
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
            SelectW(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddCardPage()));
              },
              icon: AppIcons.plus2,
              title: "Добавить карту",
              isSelected: false,
            ),
          ],
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
