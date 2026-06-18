import 'package:flutter/material.dart';
import 'package:flutter_last_exam/core/const/colors/Appcolors.dart';
import 'package:flutter_last_exam/core/widgets/CustomTextWidget.dart';

class CustomTitleWIdget extends StatelessWidget {
  const CustomTitleWIdget({
    super.key,
    required this.text,
    required this.color,
    required this.textcolor,
  });
  final String text;
  final Color color;
  final Color textcolor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Customtextwidget(
          text: text,
          fontsize: 20,
          fontWeight: FontWeight.w700,
          color: Appcolors.white,
        ),
        SizedBox(height: 10),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(color: color),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                SizedBox(height: 15),
                Customtextwidget(
                  textalign: TextAlign.center,
                  text:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
                  fontsize: 9,
                  fontWeight: FontWeight.w400,
                  color: textcolor,
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
