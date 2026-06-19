import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_last_exam/core/const/colors/Appcolors.dart';
import 'package:flutter_last_exam/core/const/icons/Appicons.dart';
import 'package:flutter_last_exam/core/widgets/CustomTextWidget.dart';
import 'package:flutter_svg/svg.dart';

class CustomProfileWidget extends StatelessWidget {
  const CustomProfileWidget({
    super.key,
    required this.text,
    required this.icon,
    this.onTap,
  });
  final String text;
  final String icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(icon, height: 35, width: 35),
        SizedBox(width: 20),
        Customtextwidget(
          text: text,
          fontsize: 16,
          fontWeight: FontWeight.w400,
          color: Appcolors.white,
        ),
        Spacer(),
        InkWell(
          onTap: onTap,
          child: SvgPicture.asset(Appicons.right, height: 12, width: 12),
        ),
      ],
    );
  }
}
