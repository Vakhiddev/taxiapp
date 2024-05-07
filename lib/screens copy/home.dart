import 'package:flutter/material.dart';
import 'package:taxiapp/custom_widgets/text_container.dart';

import '../custom_widgets/credit_card.dart';
import '../custom_widgets/custom_container.dart';
import '../custom_widgets/service_buttons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: TextContainer(
                  'Что нужно сделать?',
                  fontWeight: FontWeight.w400,
                ),
              ),
              customContainer(
                  height: height * 0.2,
                  width: width,
                  image: "assets/images/taxi.png",
                  label: "заказать такси",
                  onTap: () {}),
              SizedBox(height: height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  customContainer(
                      height: height * 0.2,
                      width: width / 2 - 20,
                      image: "assets/images/truck.png",
                      label: 'Сервис и услуги',
                      onTap: () {}),
                  customContainer(
                      height: height * 0.2,
                      width: width / 2 - 20,
                      image: "assets/images/ford.png",
                      label: 'Заказать доставку',
                      onTap: () {}),
                ],
              ),
              SizedBox(height: height * 0.01),
              customCard(
                  onPressed: () {},
                  image: "assets/images/uz_card.png",
                  cardNumber: "4455 **** **** 6336"),
              SizedBox(height: height * 0.01),
              SizedBox(
                height: height * 0.22,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    serviceButtons(
                        height: 50,
                        width: width * 0.3,
                        info: 'Монтаж',
                        image: 'assets/images/shina.png',
                        onTap: () {}),
                    serviceButtons(
                        height: height * 0.3,
                        width: width * 0.3,
                        info: 'Бензин',
                        image: 'assets/images/petrol.png',
                        onTap: () {}),
                    serviceButtons(
                        height: height * 0.3,
                        width: width * 0.3,
                        info: 'Зарядка',
                        image: 'assets/images/battery.png',
                        onTap: () {}),
                    serviceButtons(
                        height: height * 0.3,
                        width: width * 0.3,
                        info: 'Перегон',
                        image: 'assets/images/key.png',
                        onTap: () {}),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
