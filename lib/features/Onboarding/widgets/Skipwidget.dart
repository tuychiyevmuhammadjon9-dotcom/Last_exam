import 'package:flutter/material.dart';
import 'package:flutter_last_exam/core/const/colors/Appcolors.dart';
import 'package:flutter_last_exam/core/const/icons/Appicons.dart';
import 'package:flutter_last_exam/core/widgets/CustomTextWidget.dart';
import 'package:flutter_svg/svg.dart';

class Skipwidget extends StatelessWidget {
  const Skipwidget({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Customtextwidget(
            text: 'Skip',
            fontsize: 12,
            fontWeight: FontWeight.w500,
            color: Appcolors.textprimary,
          ),
        ),
        SizedBox(width: 5),
        SvgPicture.asset(Appicons.right, width: 11, height: 11),
      ],
    );
  }
}
