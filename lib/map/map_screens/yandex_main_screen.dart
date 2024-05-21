import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxiapp/custom_widgets/text_container.dart';
import 'package:taxiapp/map/map_screens/yandex_search.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../bottomSheet/taxi_button_sheet.dart';
import '../../custom_widgets/back_button.dart';
import '../core/map_services/yandex_map_service.dart';

class MainYandex extends StatefulWidget {
  const MainYandex({super.key});

  @override
  State<MainYandex> createState() => _MainYandexState();
}

class _MainYandexState extends State<MainYandex>
    with SingleTickerProviderStateMixin {
  double opacity = 0;

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
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          height: 52,
          width: 52,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                color: Colors.white,
              )),
          child: FloatingActionButton(
            hoverColor: Colors.black,
            elevation: 10,
            onPressed: () {
              _fetchCurrentLocation();
            },
            backgroundColor: const Color(0xFF1E2127),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(100.0))),
            child: Padding(
              padding: const EdgeInsets.only(top: 4, right: 4),
              child: Image.asset(
                'assets/icons/iconsendd.png',
                height: 200,
                width: 200,
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          YandexMap(
            mapObjects: mapObject,
            onMapTap: (point) {
              // print(point.latitude);
              // print(point.longitude);
              taxiButtonSheet(context);
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
                            'Выберите тип грузовика',
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
          // const StaticMapImage(
          //   options: StaticMapOptions(
          //     width: 400,
          //     height: 400,
          //     padding: 50,
          //     scale: 2,
          //     overlays: [
          //       // Add a path to the map
          //       StaticMapPath(
          //         polyline:
          //             'w}seFdghjVrDe@xAS~AQfAMJAZElAO~@KXC~AQWcEGw@IqAS_DEu@OgB?IAOASAQc@qGi@gI_@wFIqAg@gIzAS|ASvDc@l@Gx@Kt@I^G?YHu@DSBGBIJQBE^c@d@o@Pc@FWBKBS?m@g@yHC_@C]c@}GIiASaDKyAAWMeBEk@IoAIkAO{BOaCKqAGcAEk@Eu@IeAIyAMiBEw@SeDE?',
          //         opacity: 0.9,
          //         outlineSize: 0,
          //       ),
          //       // Add origin marker
          //       StaticMapMarker(
          //         point: StaticMapLatLng(37.79052, -122.43587),
          //         color: Color(0xffC21DB3),
          //         size: 8,
          //       ),
          //       // Add destination marker
          //       StaticMapMarker(
          //         point: StaticMapLatLng(37.78603, -122.41134),
          //         color: Color(0xffC21DB3),
          //         size: 8,
          //       ),
          //     ],
          //   ),
          // )

          // Positioned(
          //   left: MediaQuery.of(context.size),
          //   child: ElevatedButton(onPressed: (){}, child:Text('dddd')))
        ],
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
      animation: const MapAnimation(type: MapAnimationType.smooth, duration: 5),
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
            scale: 2,
            image: BitmapDescriptor.fromAssetImage('assets/routing.png'),
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
