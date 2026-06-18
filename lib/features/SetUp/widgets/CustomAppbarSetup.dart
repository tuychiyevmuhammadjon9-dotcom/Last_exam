import 'package:flutter/material.dart';
import 'package:flutter_last_exam/core/const/colors/Appcolors.dart';
import 'package:flutter_last_exam/core/const/icons/Appicons.dart';
import 'package:flutter_last_exam/core/widgets/CustomTextWidget.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppbarSetup extends StatelessWidget {
  const CustomAppbarSetup({super.key, required this.ontap});
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 20,
      title: Customtextwidget(
        text: 'back',
        fontsize: 11,
        fontWeight: FontWeight.w500,
        color: Appcolors.textprimary,
      ),
      centerTitle: false,
      leading: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: GestureDetector(
          onTap: ontap,
          child: SvgPicture.asset(Appicons.left, width: 11, height: 11),
        ),
      ),
    );
  }
}
