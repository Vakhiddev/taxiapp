import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxiapp/drawer_menu/myadress.dart';
import 'package:taxiapp/theme/colors.dart';
import '../custom_widgets/back_button.dart';
import '../custom_widgets/container_button.dart';
import '../custom_widgets/text_container.dart';

class NewLocation extends StatefulWidget {
  const NewLocation({super.key});

  @override
  State<NewLocation> createState() => _NewLocationState();
}

class _NewLocationState extends State<NewLocation> {
  TextEditingController addressController = TextEditingController();
  TextEditingController addressNameController = TextEditingController();
  Color containerColor = const Color.fromRGBO(117, 117, 117, 1);
  Color textColor = const Color.fromRGBO(255, 255, 255, 1);

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
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyAdress()));
                      },
                    ),
                    const TextContainer(
                      "Новый адрес",
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
                const TextContainer(
                  'Адрес локации',
                ),
                const SizedBox(height: 16),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      if (value.length > 3) {
                        containerColor = const Color.fromRGBO(255, 214, 0, 1);
                        textColor = const Color.fromRGBO(0, 0, 0, 1);
                      } else {
                        containerColor =
                            const Color.fromRGBO(117, 117, 117, 1); // Gray
                        textColor = const Color.fromRGBO(255, 255, 255, 1);
                      }
                    });
                  },
                  cursorColor: Colors.grey,
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: Theme.of(context).customColor.mainTextColor),
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Theme.of(context).customColor.textFieldColor,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    hintText: 'Введите адрес локации',
                    hintStyle: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: Theme.of(context).customColor.mainTextColor),
                    ),
                    suffixIcon: TextButton(
                      child: const TextContainer(
                        'Карта',
                        fontWeight: FontWeight.w400,
                      ),
                      onPressed: () {},
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                          color: Theme.of(context).customColor.borderColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                          color: Theme.of(context).customColor.borderColor),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).customColor.borderColor),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const TextContainer(
                  'Название локации',
                ),
                const SizedBox(height: 18),
                TextField(
                  cursorColor: Colors.grey,
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: Theme.of(context).customColor.mainTextColor),
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Theme.of(context).customColor.textFieldColor,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    hintText: 'Введите название места',
                    hintStyle: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: Theme.of(context).customColor.mainTextColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                          color: Theme.of(context).customColor.borderColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                          color: Theme.of(context).customColor.borderColor),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                buttonContainer(
                  text: "Сохранить адрес",
                  containerColor: containerColor,
                  textColor: textColor,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
