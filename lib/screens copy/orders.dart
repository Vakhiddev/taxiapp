import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taxiapp/custom_widgets/back_button.dart';
import 'package:taxiapp/custom_widgets/text_container.dart';

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
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                backButton(
                  height: height * 0.9,
                  width: width * 0.9,
                  onTap: () {
                    Navigator.pop(context);
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
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            orderCard(
                height: height,
                width: width,
                time: "15.04.2024, 20:47",
                street: "Махтумкули, 79",
                home: "Домой",
                user: "Мирмахмудов Фарход\nБелая Gentra, 01 А 596 BС",
                payment: "Тариф Стандарт\n4 200 сум, оплата картой"),
            orderCard(
                height: height,
                width: width,
                time: "15.04.2024, 20:47",
                street: "Махтумкули, 79",
                home: "Домой",
                user: "Мирмахмудов Фарход\nБелая Gentra, 01 А 596 BС",
                payment: "Тариф Стандарт\n4 200 сум, оплата картой"),
            orderCard(
                height: height,
                width: width,
                time: "15.04.2024, 20:47",
                street: "Махтумкули, 79",
                home: "Домой",
                user: "Мирмахмудов Фарход\nБелая Gentra, 01 А 596 BС",
                payment: "Тариф Стандарт\n4 200 сум, оплата картой"),
            orderCard(
                height: height,
                width: width,
                time: "15.04.2024, 20:47",
                street: "Махтумкули, 79",
                home: "Домой",
                user: "Мирмахмудов Фарход\nБелая Gentra, 01 А 596 BС",
                payment: "Тариф Стандарт\n4 200 сум, оплата картой"),
          ],
        ),
      ),
    );
  }
}

Widget orderCard(
    {required double height,
    required double width,
    required String time,
    required String street,
    required String home,
    required String user,
    required String payment}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: Container(
      height: height * 0.35,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color.fromRGBO(40, 45, 53, 1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: height * 0.06,
                child: TextContainer(
                  time,
                  fontWeight: FontWeight.w700,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.circle_outlined, color: Colors.blue, size: 15,),
                SizedBox(width: width * 0.12),
                Expanded(
                  child: TextContainer(
                    street,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.14, right: width * 0.05),
              child: const Divider(
                color: Color.fromRGBO(76, 75, 75, 1.0),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.circle_outlined, color: Colors.yellow, size: 15,),
                SizedBox(width: width * 0.12),
                Expanded(
                  child: TextContainer(
                    home,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.14, right: width * 0.05),
              child: const Divider(
                color: Color.fromRGBO(76, 75, 75, 1.0),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height:20, width: 20, child: SvgPicture.asset("assets/icons/person.svg")),
                SizedBox(width: width * 0.09),
                Expanded(
                  child: TextContainer(
                    user,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.14, right: width * 0.05),
              child: const Divider(
                color: Color.fromRGBO(76, 75, 75, 1.0),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                 const SizedBox(height:20, width: 20, child: ImageIcon(AssetImage("assets/icons/Wallet.png"), color: Colors.white,)),
                SizedBox(width: width * 0.09),
                Expanded(
                  child: TextContainer(
                    payment,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
