import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxiapp/custom_widgets/text_container.dart';
import 'package:taxiapp/screens%20copy/main_screen.dart';
import '../custom_widgets/container_button.dart';
import '../custom_widgets/back_button.dart';

class AuthScreenConfirmation extends StatefulWidget {
  const AuthScreenConfirmation({super.key});

  @override
  State<AuthScreenConfirmation> createState() => _AuthScreenConfirmationState();
}

class _AuthScreenConfirmationState extends State<AuthScreenConfirmation> {
  TextEditingController numberController = TextEditingController();
  Color containerColor = const Color.fromRGBO(117, 117, 117, 1);
  Color textColor = const Color.fromRGBO(255, 255, 255, 1);
   int numberSms = 1111;
  bool sendSms = false, checkSms = false;
  String timerText = '01:00';

  Timer? timer;

  @override
  void dispose() {
    timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  void startTimer() {
    const oneSecond = Duration(seconds: 1);
    timer = Timer.periodic(oneSecond, (timer) {
      if (timerText == '00:00') {
        timer.cancel();
      } else {
        setState(() {
          List<String> timeSplit = timerText.split(':');
          int minutes = int.parse(timeSplit[0]);
          int seconds = int.parse(timeSplit[1]);

          if (seconds > 0) {
            seconds--;
          } else {
            seconds = 59;
            minutes--;
          }
          timerText =
          '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
        });
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
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
                  "Проверка кода",
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(height: height * 0.012),
                const TextContainer(
                  "Введите код, который вы получили на указанный номер телефона",
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: height * 0.025),


                SizedBox(
                  height: 65,
                  child: TextField(
                    controller: numberController,
                    keyboardType: TextInputType.phone,
                    onChanged: (value) {
                      setState(() {
                        if (value.length > 3) {
                          containerColor = const Color.fromRGBO(255, 214, 0, 1);
                          textColor = const Color.fromRGBO(0, 0, 0, 1);
                        } else {
                          containerColor = const Color.fromRGBO(117, 117, 117, 1); // Gray
                          textColor = const Color.fromRGBO(255, 255, 255, 1);
                        }
                      });
                    },
                    cursorColor: Colors.grey,
                    textAlign: TextAlign.center, // Align text to the center
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        color: Colors.white,
                      ),
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromRGBO(38, 40, 45, 1),
                      focusColor: const Color.fromRGBO(38, 40, 45, 1),
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
                    ),
                  ),
                ),



                const SizedBox(height: 16),
                buttonContainer(
                    text: "Ok",
                    containerColor: containerColor,
                    textColor: textColor,
                  onTap: (){
                  int.parse(numberController.text) != numberSms ? (setState(() {
                    checkSms = true;
                  })): (setState(() {
                    checkSms = false;
                    sendSms = false;
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const MainScreen()));
                  }));
                  }
                ),
                
                checkSms ? const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Center(child: TextContainer("Вы ввели не верный код авторизации, попробуйте запросить код повторно", fontSize: 14,textColor: Colors.red,fontWeight: FontWeight.w500,textAlign: TextAlign.center,)),
                ):const SizedBox(),

                const Spacer(),


                Center(
                  child: MaterialButton(
                    splashColor: Colors.transparent, // Remove splash color
                    onPressed: () async {
                      setState(() {
                        numberController.clear();
                        sendSms = true;
                        timerText = '00:59'; // Reset the timer text
                      });
                      startTimer(); // Start the timer
                      await Future.delayed(Duration(seconds: 60));
                      setState(() {
                        sendSms = false;
                      });
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: const TextContainer(
                      "Запросить код повторно ",
                      textColor: Color.fromRGBO(240, 199, 93, 1),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                sendSms ?  Padding(
                  padding: const EdgeInsets.only(bottom: 18.0),
                  child: Center(child: TextContainer("можно через    $timerText", textAlign: TextAlign.center)),
                ) : const SizedBox(height: 5,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
