import 'package:flutter/material.dart';
import 'package:flutter_last_exam/core/const/colors/Appcolors.dart';
import 'package:flutter_last_exam/core/const/icons/Appicons.dart';
import 'package:flutter_last_exam/core/widgets/CustomTextWidget.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppbarAuth extends StatelessWidget {
  const CustomAppbarAuth({super.key, this.ontap, required this.text});
  final VoidCallback? ontap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 20,
      centerTitle: true,
      title: Customtextwidget(
        text: text,
        fontsize: 15,
        fontWeight: FontWeight.bold,
        color: Appcolors.textprimary,
      ),
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
