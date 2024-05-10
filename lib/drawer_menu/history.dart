import 'package:flutter/material.dart';
import 'package:taxiapp/custom_widgets/text_container.dart';

import '../custom_widgets/back_button.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  var onTap;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 32.0, left: 20.0, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                backButton(height: height, width: width),
                const TextContainer(
                  'История заказов',
                  fontWeight: FontWeight.w600,
                ),
                const ImageIcon(
                  AssetImage("assets/Filter1.png"),
                  color: Colors.white,
                )
              ],
            ),
          ),
          const TextContainer(
            'Здесь появятся ваши заказы',
            textColor: Color(0xffA8A8A8),
            // textAlign: ,
          ),
          const SizedBox(
            height: 48,
          )
        ],
      ),
    );
  }
}
