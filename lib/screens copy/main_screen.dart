import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:taxiapp/custom_widgets/text_container.dart';
import '../custom_widgets/bottom_nav_bar.dart';
import '../custom_widgets/credit_card.dart';
import '../custom_widgets/custom_container.dart';
import '../custom_widgets/custom_drawer.dart';
import '../custom_widgets/service_buttons.dart';
import 'home.dart';
import 'notes.dart';
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
  XFile? _image; // Removed 'late'

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) { // Check if an image is picked
      setState(() {
        _image = pickedImage;
      });
    }
  }
  List<Widget> pages = [
    const Home(),
    const Notes(),
    const Support(),
    const Setting(),
  ];
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
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leadingWidth: 75,
        leading: GestureDetector(
            onTap: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            child: CircleAvatar(backgroundColor: CupertinoColors.white,
              backgroundImage: _image != null ? FileImage(File(_image!.path)) : null,
            )),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextContainer(
              'Доброе утро',
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
            TextContainer(
              'Дмитрий Сергеевич',
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const ImageIcon(
              AssetImage("assets/icons/Notification.png"),
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      drawer: drawer(packageInfo: _packageInfo, image: _image, onTap: ()async{
        log("message");
        await _pickImage();
      }),
      body: pages[currentIndex],
      bottomNavigationBar: bottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
    );
  }
}
