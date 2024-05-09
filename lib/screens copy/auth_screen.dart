import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxiapp/custom_widgets/text_container.dart';
import '../custom_widgets/container_button.dart';
import 'auth_confirmation.dart';
import '../custom_widgets/back_button.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController numberController = TextEditingController();
  Color containerColor = const Color.fromRGBO(117, 117, 117, 1);
  Color textColor = const Color.fromRGBO(255, 255, 255, 1);
  int number = 0;
  bool isPush = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                backButton(height: height, width: width, onTap: () {
                  Navigator.pop(context);
                }),
                SizedBox(height: height * 0.12),
                const TextContainer(
                  "Войти в аккаунт",
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(height: height * 0.012),
                const TextContainer(
                  "Пожалуйста, укажите свой номер телефона мы пришлем SMS с кодом",
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: height * 0.025),


                SizedBox(
                  height: 60,
                  child: TextField(
                    controller: numberController,
                    onChanged: (value) {
                      setState(() {
                        if (value.length > 8) {
                          containerColor = const Color.fromRGBO(255, 214, 0, 1);
                          textColor = const Color.fromRGBO(0, 0, 0, 1);
                          isPush = true;
                        } else {
                          containerColor = const Color.fromRGBO(117, 117, 117, 1); // Gray
                          textColor = const Color.fromRGBO(255, 255, 255, 1);
                          isPush = false;
                        }
                      });
                    },
                    cursorColor: Colors.grey,
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        color: Colors.white,
                      ),
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromRGBO(38, 40, 45, 1),
                      focusColor: const Color.fromRGBO(38, 40, 45, 1),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(
                            right: 24.0,
                            left: 16,
                            bottom: 10,
                            top: 10
                        ),
                        child: Container(
                          height: 36,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: const DecorationImage(
                              image: AssetImage("assets/images/uzbek_flag.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      prefixText: '+998 ',
                      prefixStyle: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          color: Colors.white,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(38, 40, 45, 1),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(38, 40, 45, 1),
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),  // Adjust this value as needed
                    ),
                  ),
                ),

                // SizedBox(
                //   height: 60,
                //   child: TextField(
                //     controller: numberController,
                //     onChanged: (value) {
                //       setState(() {
                //         if (value.length > 12) {
                //           containerColor = const Color.fromRGBO(255, 214, 0, 1);
                //           textColor = const Color.fromRGBO(0, 0, 0, 1);
                //           isPush = true;
                //         } else {
                //           containerColor = const Color.fromRGBO(117, 117, 117, 1); // Gray
                //           textColor = const Color.fromRGBO(255, 255, 255, 1);
                //           isPush = false;
                //         }
                //       });
                //     },
                //     cursorColor: Colors.grey,
                //     style: GoogleFonts.montserrat(
                //       textStyle: const TextStyle(
                //         fontSize: 25,
                //         fontWeight: FontWeight.w500,
                //         fontStyle: FontStyle.normal,
                //         color: Colors.white,
                //       ),
                //     ),
                //     decoration: InputDecoration(
                //       filled: true,
                //       fillColor: const Color.fromRGBO(38, 40, 45, 1),
                //       focusColor: const Color.fromRGBO(38, 40, 45, 1),
                //       prefixIcon: Padding(
                //         padding: const EdgeInsets.only(
                //             right: 24.0,
                //             left: 16,
                //             bottom: 10,
                //             top: 10
                //         ),
                //         child: Container(
                //           height: 36,
                //           width: 50,
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(5),
                //             image: const DecorationImage(
                //               image: AssetImage("assets/images/uzbek_flag.png"),
                //               fit: BoxFit.cover,
                //             ),
                //           ),
                //         ),
                //       ),
                //       enabledBorder: OutlineInputBorder(
                //         borderSide: const BorderSide(
                //           color: Color.fromRGBO(38, 40, 45, 1),
                //         ),
                //         borderRadius: BorderRadius.circular(10),
                //       ),
                //       focusedBorder: const OutlineInputBorder(
                //         borderRadius: BorderRadius.all(Radius.circular(10.0)),
                //         borderSide: BorderSide(
                //           color: Color.fromRGBO(38, 40, 45, 1),
                //         ),
                //       ),
                //       contentPadding: EdgeInsets.symmetric(vertical: 10),  // Adjust this value as needed
                //     ),
                //   ),
                // ),


                const SizedBox(height: 16),
                buttonContainer(
                    text: "Отправить код для входа",
                    containerColor: containerColor,
                    textColor: textColor,
                    onTap: (){
                      if(isPush){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const AuthScreenConfirmation()));
                      }
                    }
                ),

                const SizedBox(height: 288),


                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: const TextStyle(
                        color: Colors.white, // Set the text color to white
                      ),
                      children: [
                        TextSpan(
                          text: 'Продолжая вход в аккаунт,\n',
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                color: Colors.white),
                          ),
                        ),
                        TextSpan(
                          text: 'Вы принимаете наши ',
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                color: Colors.white),
                          ),
                        ),
                        TextSpan(
                          text: 'Правила и Условия',
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
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
