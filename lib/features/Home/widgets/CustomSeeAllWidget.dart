import 'package:flutter/material.dart';
import 'package:flutter_last_exam/core/const/colors/Appcolors.dart';
import 'package:flutter_last_exam/core/const/icons/Appicons.dart';
import 'package:flutter_last_exam/core/widgets/CustomTextWidget.dart';
import 'package:flutter_svg/svg.dart';

class CustomSeeAllWIdget extends StatelessWidget {
  const CustomSeeAllWIdget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Customtextwidget(
            text: title,
            fontsize: 16,
            fontWeight: FontWeight.w700,
            color: Appcolors.textprimary,
          ),
          Spacer(),
          Customtextwidget(
            text: 'See all',
            fontsize: 15,
            fontWeight: FontWeight.w500,
            color: Appcolors.white,
          ),
          SizedBox(width: 5),
          SvgPicture.asset(Appicons.right, width: 15, height: 15),
        ],
      ),
    );
  }
}
