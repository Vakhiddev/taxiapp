import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:taxiapp/bottomSheet/selection_button_sheet.dart';
import 'package:taxiapp/bottomSheet/service_button_sheet.dart';
import 'package:taxiapp/bottomSheet/taxi_cancel_button_sheet.dart';

int index = 1;
Future taxiButtonSheet(
  BuildContext context,
) async {
  await showModalBottomSheet(
    isDismissible: false,
    context: context,
    builder: (BuildContext builderContext) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
              return Container(
                height: 340,
                padding: const EdgeInsets.only(left: 17, right: 15, bottom: 20),
                decoration: const BoxDecoration(
                  color: Color(0xFF1F2126),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: KeyboardDismisser(
                  child: NotificationListener<DraggableScrollableNotification>(
                    onNotification: (notification) {
                      if (notification.extent < 0.5) {
                        Navigator.of(context).pop();
                        return true;
                      }
                      return false;
                    },
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 13),
                          SvgPicture.asset("assets/icons/icons/line.svg"),
                          const SizedBox(height: 13),
                          Row(
                            children: [
                              Column(
                                children: [
                                  addressSelect(
                                    isStartOrFinish: true,
                                    address: "Махтумкули, 79",
                                  ),
                                  const SizedBox(height: 19),
                                  addressSelect(
                                    isStartOrFinish: false,
                                    address: "Домой",
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SvgPicture.asset("assets/icons/icons/arrows.svg")
                            ],
                          ),
                          const SizedBox(height: 18),
                          SizedBox(
                            height: 82,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                orderCarType(
                                    minute: 12,
                                    title: "Стандарт",
                                    price: "4 200 сум",
                                    image: "assets/images/standart_car.png",
                                    isSelected: index == 1,
                                    onPressed: () {
                                      setState(() {
                                        index = 1;
                                      });
                                    }),
                                const SizedBox(width: 12),
                                orderCarType(
                                    minute: 2,
                                    title: "Бизнес",
                                    price: "7 500 сум",
                                    image: "assets/icons/images/biznes_car.png",
                                    isSelected: index == 2,
                                    onPressed: () {
                                      setState(() {
                                        index = 2;
                                      });
                                    }),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          rowButtons(
                              title: "Заказать",
                              onTap: () {
                                Navigator.pop(context);
                                taxiCancelButtonSheet(context);
                              },
                              onPaymentTap: () {
                                Navigator.pop(context);
                                 selectionButtonSheet(context, true,RootType.taxiBSheet);
                              },
                              onFilterTap: (){
                                Navigator.pop(context);
                                selectionButtonSheet(context, false, RootType.taxiBSheet);
                              },
                              paymentIcon: "assets/icons/icons/uzcard.svg")
                        ],
                      ),
                    ),
                  ),
                ),
              );

        },
      );
    },
  );
}