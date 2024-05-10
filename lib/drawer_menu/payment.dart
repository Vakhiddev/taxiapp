import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../custom_widgets/back_button.dart';
import '../custom_widgets/text_container.dart';
import '../screens copy/main_screen.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
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
                    SizedBox(
                      child: SvgPicture.asset(
                        "assets/icons/plus.svg",
                        color: Colors.white,

                        // fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                paymentButton(
                    title: "Наличные",
                    image: "assets/icons/wallet.svg",
                    onPressed: () {}),
                // paymentButton(
                //     title: "4455 **** **** 4331",
                //     image: "assets/icons/card.svg",
                //     onPressed: () {}),
                paymentButton(
                    title: "Добавить карту",
                    image: "assets/icons/littleplus.svg",
                    onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget paymentButton(
    {required String title, required String image, VoidCallback? onPressed}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: MaterialButton(
      color: const Color.fromRGBO(40, 45, 53, 1),
      height: 48,
      minWidth: double.infinity,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(0),
            child: SvgPicture.asset(image),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextContainer(title),
          )
        ],
      ),
    ),
  );
}
