import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:taxiapp/drawer_menu/set_language.dart';
import '../custom_widgets/back_button.dart';
import '../custom_widgets/text_container.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool status7 = false;




  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    backButton(
                      height: height * 0.8,
                      width: width * 0.8,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    const TextContainer(
                      "Настройки",
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(
                      height: 10,
                      width: 10,
                    ),
                  ],
                ),
                SizedBox(height: height * 0.05),

                Container(
                  height: height * 0.07,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color.fromRGBO(38, 40, 45, 1)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextContainer("Включить ночной режим"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FlutterSwitch(
                          width: 80.0,
                          height: 40.0,
                          toggleSize: 45.0,
                          value: status7,
                          borderRadius: 30.0,
                          padding: 2.0,
                          activeToggleColor: const Color(0xFF3F3F3F),
                          inactiveToggleColor: const Color(0xFF2F363D),
                          activeSwitchBorder: Border.all(
                            color: const Color(0xFF000000),
                            width: 3.0,
                          ),

                          inactiveSwitchBorder: Border.all(
                            color: const Color(0xFF000000),
                            width: 3.0,
                          ),
                          activeColor: const Color(0xFF29292E),
                          inactiveColor: Colors.white,
                          activeIcon: const Icon(
                            Icons.nightlight_round,
                            color: Color(0xFFF8E3A1),
                          ),
                          inactiveIcon: const Icon(
                            Icons.wb_sunny,
                            color: Color(0xFFFFDF5D),
                          ),
                          onToggle: (val) {
                            setState(() {
                              status7 = val;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: height * 0.02),

                Container(
                  height: height * 0.07,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color.fromRGBO(38, 40, 45, 1)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextContainer("Русский язык"),
                      ),

                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const SetLanguage()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: SvgPicture.asset("assets/icons/right.svg"),
                        ),
                      ),
                    ],
                  ),
                ),






              ],
            ),
          ),
        ),
      ),
    );
  }
}


