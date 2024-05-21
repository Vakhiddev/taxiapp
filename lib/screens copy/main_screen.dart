import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:taxiapp/custom_widgets/text_container.dart';
import '../custom_widgets/bottom_nav_bar.dart';
import '../custom_widgets/custom_drawer.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'home.dart';
import 'orders.dart';
import 'settings.dart';
import 'support.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  static const String id = "/main_screen";

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  XFile? _image;
  late AdvancedDrawerController advancedDrawerController =
      AdvancedDrawerController(); // Removed 'late'

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      // Check if an image is picked
      setState(() {
        _image = pickedImage;
      });
    }
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    advancedDrawerController.showDrawer();
  }

  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(color: Color(0xff1E2127)),
      ),
      controller: advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        // boxShadow: [
        //   BoxShadow(
        //     color: Color(0XFFFFFFFF),
        //     offset: Offset(0.0, 8.0),
        //     blurRadius: 16.0,
        //   )
        // ],
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      drawer: drawer(
          packageInfo: _packageInfo,
          image: _image,
          avatarPressed: () async {
            log("message");
            await _pickImage();
          },
          height: height,
          context: context),
      child: Scaffold(
        body: [
          Home(
            callback: () {
              _handleMenuButtonPressed();
            },
          ),
          const Orders(),
          const Support(),
          const SettingScreen(),
        ][currentIndex],
        bottomNavigationBar: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: bottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
          ),
        ),
      ),
    );
  }
}
