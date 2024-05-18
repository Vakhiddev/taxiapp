import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxiapp/screens/onboardingscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => OnboardingScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 156,
                height: 156,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(38),
                    color: Color(0xFF27282A),
                    image:
                        DecorationImage(image: AssetImage('assets/logo.png'))),
              ),
              // SvgPicture.asset('assets/splash.svg'),
              SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Tez',
                      style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                              fontSize: 29,
                              fontWeight: FontWeight.w800,
                              fontStyle: FontStyle.normal,
                              color: Colors.white))),
                  SizedBox(
                    width: 2,
                  ),
                  Text('Taxi',
                      style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                              fontSize: 29,
                              fontWeight: FontWeight.w800,
                              fontStyle: FontStyle.normal,
                              color: Colors.yellow))),
                ],
              ),

              Text('Онлайн служба такси',
                  style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.normal,
                          color: Color(0xffFFFFFF)))),
            ],
          ),
        ),
      ),
    );
  }
}
