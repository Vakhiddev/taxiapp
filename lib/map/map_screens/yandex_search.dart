import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxiapp/custom_widgets/text_container.dart';
import 'package:taxiapp/main.dart';
import 'package:taxiapp/map/map_screens/yandex_main_screen.dart';
import 'package:taxiapp/theme/colors.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import '../core/map_services/yandex_map_service.dart';

class SearchYandex extends StatefulWidget {
  const SearchYandex({super.key});

  @override
  State<SearchYandex> createState() => _SearchYandexState();
}

class _SearchYandexState extends State<SearchYandex> {
  double opacity = 0;
  bool isSearchingPage = false;

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
    // addObjects(appLatLong: currentLocation);
    return SafeArea(
      child: Scaffold(
        floatingActionButton: isSearchingPage
            ? null
            : Align(
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
            if (isSearchingPage != true)
              YandexMap(
                mapObjects: mapObject,
                zoomGesturesEnabled: true,
                nightModeEnabled: true,
                onMapCreated: (controller) {
                  mapControllerCompleter.complete(controller);
                },
              ),
            Column(
              children: [
                const SizedBox(height: 13),
                Container(
                  height: 52,
                  margin: EdgeInsets.symmetric(horizontal: 22.5),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                      color: Theme.of(context).customColor.containerColor,
                      border: Border.all(
                          width: 0.4,
                          color: Theme.of(context).customColor.borderColor),
                      borderRadius: BorderRadius.circular(40)),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          if (isSearchingPage == false) {
                            Navigator.pop(context);
                          }
                          if (isSearchingPage == true) {
                            setState(() {
                              isSearchingPage = false;
                            });
                          }
                        },
                        child: SvgPicture.asset(
                          "assets/icons/icons/small_back.svg",
                          color: Theme.of(context).customColor.mainTextColor,
                        ),
                      ),
                      const SizedBox(width: 23),
                      Expanded(
                        child: TextFormField(
                            textAlignVertical: TextAlignVertical.center,
                            onTap: () {
                              setState(() {
                                isSearchingPage = true;
                              });
                            },
                            decoration: InputDecoration(
                                isDense: true,
                                alignLabelWithHint: true,
                                suffixStyle: TextStyle(
                                    color: Theme.of(context)
                                        .customColor
                                        .mainTextColor,
                                    fontSize: 16),
                                border: InputBorder.none,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                hintText: 'Куда хотите поехать?',
                                hintStyle: TextStyle(
                                    color: Theme.of(context)
                                        .customColor
                                        .mainTextColor)),
                            style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              color: Colors.white,
                            ))),
                      ),
                      isSearchingPage
                          ? SvgPicture.asset(
                              "assets/icons/icons/search_text_field.svg")
                          : TextContainer(
                              'Карта',
                              textColor: Colors.grey,
                            )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                if (isSearchingPage == true)
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 42),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainYandex(),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/icons/savat.svg",
                                color:
                                    Theme.of(context).customColor.mainTextColor,
                              ),
                              const SizedBox(
                                width: 17,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextContainer(
                                    "Mega Planet",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  const SizedBox(height: 4),
                                  SizedBox(
                                    width: screenWidth * 0.6,
                                    child: TextContainer(
                                      maxLine: 4,
                                      textOverflow: TextOverflow.clip,
                                      "массив Юнусабад 13 квартал, Юнусабадский район, Ташкент",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 21),
                        Divider(color: Color(0xFF373C46), thickness: 1),
                        const SizedBox(height: 21),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainYandex(),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/icons/portfel.svg",
                                color:
                                    Theme.of(context).customColor.mainTextColor,
                              ),
                              const SizedBox(
                                width: 17,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextContainer(
                                    "Mega Plan",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  const SizedBox(height: 4),
                                  SizedBox(
                                    width: screenWidth * 0.6,
                                    child: TextContainer(
                                      maxLine: 4,
                                      textOverflow: TextOverflow.clip,
                                      "массив Юнусабад, Юнусабадский район, Ташкент, Узбекистан",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
              ],
            ),

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
    //         scale: 5,
    //         image: BitmapDescriptor.fromAssetImage('assets/taxicar.png'),
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
