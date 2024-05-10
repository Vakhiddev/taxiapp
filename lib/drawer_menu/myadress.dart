import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../custom_widgets/back_button.dart';
import '../custom_widgets/text_container.dart';
import '../screens copy/main_screen.dart';

class MyAdress extends StatefulWidget {
  const MyAdress({super.key});

  @override
  State<MyAdress> createState() => _MyAdressState();
}

class _MyAdressState extends State<MyAdress> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(children: [
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
                "Мои адреса",
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
        ]),
      ),
    )));
  }
}
