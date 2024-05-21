import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:taxiapp/bottomSheet/selection_button_sheet.dart';
import 'package:taxiapp/custom_widgets/text_container.dart';
import 'package:taxiapp/map/map_screens/yandex_main_screen.dart';
import 'package:taxiapp/map/map_screens/yandex_order.dart';
import 'package:taxiapp/map/map_screens/yandex_search.dart';
import 'package:taxiapp/map/map_screens/yandex_service.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import '../custom_widgets/credit_card.dart';
import '../custom_widgets/custom_container.dart';
import '../custom_widgets/service_buttons.dart';

class Home extends StatefulWidget {
  final VoidCallback callback;
  const Home({super.key, required this.callback});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  @override
  Widget build(
    BuildContext context,
  ) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height:
                    kToolbarHeight, // Set the height to match the AppBar's height
                color: Colors
                    .transparent, // Set the color to match the AppBar's background color
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        widget.callback();
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: width * 0.05, right: 10),
                        child: Material(
                          color: Colors
                              .transparent, // Set material color to transparent
                          borderRadius: BorderRadius.circular(999),
                          child: Container(
                              height: height * 0.1,
                              width: width * 0.15 - 2,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xFFF9AD42), width: 1),
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/user_foto.png")))),
                        ),
                      ),
                    ),

                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Доброе утро',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.white),
                        ),
                        Text(
                          'Дмитрий Сергеевич',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    const Spacer(), // Use Spacer to push actions to the right
                    IconButton(
                      onPressed: () {},
                      icon: const ImageIcon(
                        AssetImage("assets/icons/Notification.png"),
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
              SizedBox(height: height * 0.017),
              const Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16, top: 14),
                child: TextContainer(
                  'Что нужно сделать?',
                  fontWeight: FontWeight.w400,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: customContainer(
                    height: height * 0.17,
                    width: width,
                    image: "assets/images/taxi.png",
                    label: "Заказать такси",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SearchYandex(),
                        ),
                      );
                    }),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customContainer2(
                        height: height * 0.175,
                        width: width / 2 - 22,
                        image: "assets/images/truck.png",
                        label: 'Сервис и услуги',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ServiceYandex(),
                            ),
                          );
                        }),
                    customContainer2(
                        height: height * 0.175,
                        width: width / 2 - 22,
                        image: "assets/images/ford.png",
                        label: 'Заказать доставку',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OrderYandex(),
                            ),
                          );
                        }),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: TextContainer("Текущий способ оплаты"),
              ),
              customCard(
                  onTap: () {
                    selectionButtonSheet(context, true);
                    // selectionButtonSheet(context, true);
                  },
                  image: "assets/images/uz_card.png",
                  cardNumber: "4455 **** **** 4331",
                  height: height),
              Padding(
                padding: EdgeInsets.only(top: height * 0.027),
                child: SizedBox(
                  height: height * 0.18,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      serviceButtons(
                          height: height * 0.3,
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
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
