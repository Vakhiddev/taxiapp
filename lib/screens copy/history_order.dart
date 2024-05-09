import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taxiapp/screens%20copy/main_screen.dart';
import '../custom_widgets/back_button.dart';
import '../custom_widgets/order_card.dart';
import '../custom_widgets/text_container.dart';

class HistoryOrder extends StatefulWidget {
  const HistoryOrder({super.key});

  @override
  State<HistoryOrder> createState() => _HistoryOrderState();
}

class _HistoryOrderState extends State<HistoryOrder> {
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
                      height: height * 0.9,
                      width: width * 0.9,
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const MainScreen()));
                      },
                    ),

                    const TextContainer(
                      "История заказов",
                      fontSize: 18,
                    ),
                    SizedBox(
                      height: 33,
                      width: 33,
                      child: SvgPicture.asset(
                        "assets/icons/orderIcon.svg",
                        color: Colors.white,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  // Wrap ListView with Expanded
                  child: ListView(
                    children: [
                      orderCard(
                        height: height,
                        width: width,
                        time: "15.04.2024, 20:47",
                        street: "Махтумкули, 79",
                        home: "Домой",
                        user: "Мирмахмудов Фарход\nБелая Gentra, 01 А 596 BС",
                        payment: "Тариф Стандарт\n4 200 сум, оплата картой",
                      ),
                      orderCard(
                        height: height,
                        width: width,
                        time: "15.04.2024, 20:47",
                        street: "Махтумкули, 79",
                        home: "Домой",
                        user: "Мирмахмудов Фарход\nБелая Gentra, 01 А 596 BС",
                        payment: "Тариф Стандарт\n4 200 сум, оплата картой",
                      ),
                      orderCard(
                        height: height,
                        width: width,
                        time: "15.04.2024, 20:47",
                        street: "Махтумкули, 79",
                        home: "Домой",
                        user: "Мирмахмудов Фарход\nБелая Gentra, 01 А 596 BС",
                        payment: "Тариф Стандарт\n4 200 сум, оплата картой",
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
}
