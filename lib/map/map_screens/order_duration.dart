import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import 'package:taxiapp/custom_widgets/text_container.dart';
import 'package:taxiapp/map/core/test.dart';
import 'package:taxiapp/theme/colors.dart';

import 'package:wtf_sliding_sheet/wtf_sliding_sheet.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../bottomSheet/driver_info_button_sheet.dart';
import '../../bottomSheet/gazel_second_button_sheet.dart';
import '../../bottomSheet/second_cancel_button_sheet.dart';
import '../../bottomSheet/selection_button_sheet.dart';
import '../../bottomSheet/service_button_sheet.dart';

import '../../bottomSheet/taxi_cancel_button_sheet.dart';
import '../../custom_widgets/back_button.dart';
import '../core/map_services/yandex_map_service.dart';

class OrderDuration extends StatefulWidget {
  const OrderDuration({super.key});

  @override
  State<OrderDuration> createState() => _OrderDurationState();
}

class _OrderDurationState extends State<OrderDuration> {
  double opacity = 0;
  int index = 1;
  @override
  void initState() {
    super.initState();
    _initPermission().ignore();
  }

  List<MapObject> mapObject = [];
  AppLatLong? currentLocation;
  final mapControllerCompleter = Completer<YandexMapController>();

  @override
  Widget build(
    BuildContext context,
  ) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // addObjects(appLatLong: currentLocation);
    return Scaffold(
      // floatingActionButton: Align(
      //   alignment: Alignment.bottomRight,
      //   child: Container(
      //     height: 52,
      //     width: 52,
      //     decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(100),
      //         border: Border.all(
      //           color: Colors.white,
      //         )),
      //     child: FloatingActionButton(
      //       hoverColor: Colors.black,
      //       elevation: 10,
      //       onPressed: () {
      //         _fetchCurrentLocation();
      //       },
      //       backgroundColor: const Color(0xFF1E2127),
      //       shape: const RoundedRectangleBorder(
      //           borderRadius: BorderRadius.all(Radius.circular(100.0))),
      //       child: Padding(
      //         padding: const EdgeInsets.only(top: 4, right: 4),
      //         child: Image.asset(
      //           'assets/icons/iconsendd.png',
      //           height: 200,
      //           width: 200,
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
      body: SlidingSheet(
        color: Colors.transparent,
        snapSpec: SnapSpec(
          snap: true,
          snappings: [0.16, 1.0],
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        builder: (context, state) {
          return StatefulBuilder(
              builder: (BuildContext builderContext, StateSetter setState) {
            Future.delayed(Duration(seconds: 3), () {
              Navigator.pop(context);
              Navigator.maybePop(builderContext);
              driverInfoButtonSheet(context);
            });
            return Container(
              height: 220,
              width: double.maxFinite,
              padding: const EdgeInsets.only(
                left: 14,
                right: 19,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).customColor.mainBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: KeyboardDismisser(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 13),
                    SvgPicture.asset(
                      "assets/icons/icons/line.svg",
                      color: Theme.of(context).customColor.mainTextColor,
                    ),
                    const SizedBox(height: 14),
                    whereTo(),
                    const SizedBox(height: 15),
                    InkWell(
                      onTap: () {
                        // Navigator.pop(context);
                        secondCancelButtonSheet(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/icons/icons/cancel.svg"),
                          const SizedBox(width: 17),
                          const TextContainer(
                            "Отменить заказ",
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            );
          });
        },
        body: Stack(
          children: [
            YandexMap(
              mapObjects: mapObject,
              onMapTap: (point) {
                // print(point.latitude);
                // print(point.longitude);
                // gazelButtonSheet(context);
              },
              zoomGesturesEnabled: true,
              nightModeEnabled: true,
              onMapCreated: (controller) {
                mapControllerCompleter.complete(controller);
              },
            ),
            Positioned(
                top: 32,
                left: 0,
                right: 0,
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(40)),
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            backButton(
                              height: height * 0.9,
                              width: width * 0.9,
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                            // SizedBox(
                            //   width: 20,
                            // ),
                            TextContainer(
                              'Поиск машины для вас',
                              fontWeight: FontWeight.w600,
                            ),
                            // SizedBox(
                            //   width: 24,
                            // ),
                            IconButton(
                              onPressed: () {},
                              icon: const ImageIcon(
                                AssetImage("assets/icons/Notification.png"),
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
            WaveAnimationCircle(isActive: true)
          ],
        ),
      ),
    );
  }

  Future<void> _initPermission() async {
    if (!await LocationService().checkPermission()) {
      await LocationService().requestPermission();
    }
    await _fetchCurrentLocation();
  }

  Future<void> _fetchCurrentLocation() async {
    AppLatLong location;
    const defLocation = SamarkandLocation();
    try {
      location = await LocationService().getCurrentLocation();
    } catch (_) {
      location = defLocation;
    }
    location = defLocation;

    // addObjects(appLatLong: location);
    _moveToCurrentLocation(location);
  }

  Future<void> _moveToCurrentLocation(
    AppLatLong appLatLong,
  ) async {
    // currentLocation = appLatLong;
    (await mapControllerCompleter.future).moveCamera(
      animation: const MapAnimation(type: MapAnimationType.smooth, duration: 0),
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: Point(
            latitude: appLatLong.lat,
            longitude: appLatLong.long,
          ),
          zoom: 13,
        ),
      ),
    );
  }

  // void addObjects({required AppLatLong appLatLong}) {
  //   final myLocationMarker = PlacemarkMapObject(
  //     opacity: 1,
  //     mapId: MapObjectId('currentLocaton'),
  //     point: Point(latitude: appLatLong.lat, longitude: appLatLong.long),
  //     icon: PlacemarkIcon.single(
  //       PlacemarkIconStyle(
  //           scale: 3,
  //           image: BitmapDescriptor.fromAssetImage('assets/stay.png'),
  //           rotationType: RotationType.noRotation),
  //     ),
  //   );
  //   // final sourceLocationMarker = PlacemarkMapObject(
  //   //   opacity: 1,
  //   //   mapId: MapObjectId('currentLocaton'),
  //   //   point: Point(latitude: appLatLong.lat, longitude: appLatLong.long),
  //   //   icon: PlacemarkIcon.single(
  //   //     PlacemarkIconStyle(
  //   //         scale: 2,
  //   //         image: BitmapDescriptor.fromAssetImage('assets/Frame.png'),
  //   //         rotationType: RotationType.rotate),
  //   //   ),
  //   // );

  //   // final currentLocationCircle = CircleMapObject(
  //   //     mapId: const MapObjectId('currentLocationCircle'),
  //   //     circle: Circle(
  //   //       center: Point(latitude: appLatLong.lat, longitude: appLatLong.long),
  //   //       radius: 250,
  //   //     ),
  //   //     strokeWidth: 0,
  //   //     fillColor: Color(0xFF32ABE0)); // CircleMapObject
  //   mapObject.addAll([myLocationMarker]);
  //   setState(() {});
  // }
}
