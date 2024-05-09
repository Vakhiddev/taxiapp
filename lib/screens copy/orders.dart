import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../custom_widgets/back_button.dart';
import '../custom_widgets/order_card.dart';
import '../custom_widgets/text_container.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
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
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: const Color.fromRGBO(40, 45, 53, 1),
                              title: const TextContainer("Exit App?"),
                              content: const TextContainer("Do you want to exit the app?"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(); // Close the dialog
                                  },
                                  child: const TextContainer("Cancel"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(); // Close the dialog
                                    // Close the app
                                    SystemNavigator.pop();
                                  },
                                  child: const TextContainer("Exit",textColor: Colors.red,),
                                ),
                              ],
                            );
                          },
                        );
                      }
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
    );
  }
}
