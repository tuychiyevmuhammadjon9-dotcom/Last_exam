import 'package:flutter/material.dart';
import 'package:flutter_last_exam/core/const/colors/Appcolors.dart';
import 'package:flutter_last_exam/core/widgets/CustomTextWidget.dart';
import 'package:flutter_svg/svg.dart';

class CustomOnboardingwidget extends StatelessWidget {
  const CustomOnboardingwidget({
    super.key,
    required this.icon,
    required this.text,
  });
  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 10),
        SvgPicture.asset(icon, width: 35, height: 35),
        SizedBox(height: 7),
        Customtextwidget(
          textalign: TextAlign.center,
          text: text,
          fontsize: 16,
          fontWeight: FontWeight.w600,
          color: Appcolors.white,
        ),
      ],
    );
  }
}
