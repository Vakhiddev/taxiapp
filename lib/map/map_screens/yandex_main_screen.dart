import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:taxiapp/custom_widgets/text_container.dart';
import 'package:taxiapp/map/core/test.dart';
import 'package:taxiapp/map/map_screens/yandex_search.dart';
import 'package:wtf_sliding_sheet/wtf_sliding_sheet.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../bottomSheet/selection_button_sheet.dart';
import '../../bottomSheet/service_button_sheet.dart';
import '../../bottomSheet/taxi_button_sheet.dart';
import '../../bottomSheet/taxi_cancel_button_sheet.dart';
import '../../custom_widgets/back_button.dart';
import '../core/map_services/yandex_map_service.dart';

class MainYandex extends StatefulWidget {
  const MainYandex({super.key});

  @override
  State<MainYandex> createState() => _MainYandexState();
}

class _MainYandexState extends State<MainYandex> {
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
          snappings: [0.2, 1.0],
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        builder: (context, state) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      _fetchCurrentLocation();
                    },
                    child: SvgPicture.asset("assets/icons/share_location.svg"),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 17, right: 15, bottom: 20),
                    decoration: const BoxDecoration(
                      color: Color(0xFF1F2126),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: KeyboardDismisser(
                      child:
                          NotificationListener<DraggableScrollableNotification>(
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
                                  SvgPicture.asset(
                                      "assets/icons/icons/arrows.svg")
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
                                        image:
                                            "assets/icons/images/biznes_car.png",
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
                                    taxiCancelButtonSheet(context);
                                  },
                                  onPaymentTap: () {
                                    selectionButtonSheet(
                                        context, true, RootType.taxiBSheet);
                                  },
                                  onFilterTap: () {
                                    selectionButtonSheet(
                                        context, false, RootType.taxiBSheet);
                                  },
                                  paymentIcon: "assets/icons/icons/uzcard.svg")
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
        body: Stack(
          children: [
            YandexMap(
              mapObjects: mapObject,
              onMapTap: (point) {
                // print(point.latitude);
                // print(point.longitude);
                // taxiButtonSheet(context);
              },
              zoomGesturesEnabled: true,
              nightModeEnabled: true,
              onMapCreated: (controller) {
                mapControllerCompleter.complete(controller);
              },
            ),
            // Positioned(
            //     top: 340,
            //     left: 60,
            //     child: WaveAnimationCircle(isActive: true)),
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
                              'Выберите тариф поездки',
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

    addObjects(appLatLong: location);
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

  void addObjects({required AppLatLong appLatLong}) {
    final myLocationMarker = PlacemarkMapObject(
      opacity: 1,
      mapId: MapObjectId('currentLocaton'),
      point: Point(latitude: appLatLong.lat, longitude: appLatLong.long),
      icon: PlacemarkIcon.single(
        PlacemarkIconStyle(
            scale: 0.8,
            image: BitmapDescriptor.fromAssetImage('assets/point.png'),
            rotationType: RotationType.noRotation),
      ),
    );
    // final sourceLocationMarker = PlacemarkMapObject(
    //   opacity: 1,
    //   mapId: MapObjectId('currentLocaton'),
    //   point: Point(latitude: appLatLong.lat, longitude: appLatLong.long),
    //   icon: PlacemarkIcon.single(
    //     PlacemarkIconStyle(
    //         scale: 2,
    //         image: BitmapDescriptor.fromAssetImage('assets/Frame.png'),
    //         rotationType: RotationType.rotate),
    //   ),
    // );

    // final currentLocationCircle = CircleMapObject(
    //     mapId: const MapObjectId('currentLocationCircle'),
    //     circle: Circle(
    //       center: Point(latitude: appLatLong.lat, longitude: appLatLong.long),
    //       radius: 250,
    //     ),
    //     strokeWidth: 0,
    //     fillColor: Color(0xFF32ABE0)); // CircleMapObject
    mapObject.addAll([myLocationMarker]);
    setState(() {});
  }
}
