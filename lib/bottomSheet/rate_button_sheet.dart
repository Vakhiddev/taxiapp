import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../custom_widgets/text_container.dart';
import 'container_button.dart';

Future rateButtonSheet(
  BuildContext context,
  VoidCallback onPressed,
) async {
  await showModalBottomSheet(
    isDismissible: true,
    context: context,
    builder: (BuildContext builderContext) {
      return Container(
        height: double.maxFinite,
        width: double.maxFinite,
        padding: const EdgeInsets.only(left: 23, right: 20),
        decoration: const BoxDecoration(
          color: Color(0xFF1F2126),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: KeyboardDismisser(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 11),
                SvgPicture.asset("assets/icons/line.svg"),
                const SizedBox(height: 10),
                const TextContainer(
                  textAlign: TextAlign.center,
                  "Как вам поездка?",
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
                const SizedBox(height: 9),
                const TextContainer(
                  textAlign: TextAlign.center,
                  "Помогите нам улучшить наш сервис и ваши \nощущения во время поездки",
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                ),
                const SizedBox(height: 15),
                StarRating(
                  rating: 4, // Set initial rating
                  onRatingChanged: (rating) {},
                ),
                const SizedBox(height: 25),
                Container(
                  height: 89,
                  padding: EdgeInsets.only(left: 24, bottom: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF26282D),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextField(
                    // Dismiss the keyboard,
                    minLines: 1,
                    maxLines: 5,
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        color: Color(0xFFB0B0B0),
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Напишите ваш отзыв',
                        hintStyle: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                            color: Color(0xFFB0B0B0),
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        )),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    smallColumn("assets/icons/time.svg", "Время", "13:42"),
                    smallColumn("assets/icons/distance_beetwen.svg",
                        "Расстояние", "13 км"),
                    smallColumn("assets/icons/wallet.svg", "Сумма", "4 200"),
                  ],
                ),
                const SizedBox(height: 29),
                buttonContainer(
                  height: 60,
                  fontSize: 16,
                  textColor: Colors.black,
                  fontWeight: FontWeight.w600,
                  containerColor: Color(0xFFFFD600),
                  text: "ОЦЕНИТЬ ПОЕЗДКУ",
                  onTap: () {
                    Navigator.maybePop(builderContext);
                  },
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget smallColumn(String icon, String title, String subtitle) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SvgPicture.asset(icon),
      const SizedBox(height: 3),
      TextContainer(
        textAlign: TextAlign.center,
        title,
        fontWeight: FontWeight.w300,
        fontSize: 14,
      ),
      const SizedBox(height: 1),
      TextContainer(
        textAlign: TextAlign.center,
        subtitle,
        fontWeight: FontWeight.w700,
        fontSize: 17,
      ),
    ],
  );
}

class StarRating extends StatefulWidget {
  final int rating;
  final double? height;
  final double? spacing;
  final void Function(int) onRatingChanged;

  const StarRating(
      {Key? key,
      required this.rating,
      this.height,
      this.spacing,
      required this.onRatingChanged})
      : super(key: key);

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  late int _currentRating;

  @override
  void initState() {
    super.initState();
    _currentRating = widget.rating;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _currentRating = index + 1;
                  widget.onRatingChanged(_currentRating);
                });
              },
              child: SvgPicture.asset(
                "assets/icons/star.svg",
                // width: 35,
                height: widget.height ?? 35,
                color: index < _currentRating
                    ? Color(0xFFFFBC36)
                    : Color(0xFFCACACF),
              ),
            ),
            SizedBox(
                width: widget.spacing ??
                    10), // Add a SizedBox after each SvgPicture.asset
          ],
        );
      }),
    );
  }
}
