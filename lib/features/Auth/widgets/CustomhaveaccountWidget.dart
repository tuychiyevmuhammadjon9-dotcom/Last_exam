import 'package:flutter/material.dart';
import 'package:flutter_last_exam/core/const/colors/Appcolors.dart';
import 'package:flutter_last_exam/core/widgets/CustomTextWidget.dart';

class CustomhaveaccountWidget extends StatelessWidget {
  const CustomhaveaccountWidget({
    super.key,
    required this.text,
    required this.text2,
    required this.ontap,
  });
  final String text;
  final String text2;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Customtextwidget(
          text: text,
          fontsize: 9,
          fontWeight: FontWeight.w400,
          color: Appcolors.white,
        ),
        SizedBox(width: 5),
        GestureDetector(
          onTap: ontap,
          child: Customtextwidget(
            text: text2,
            fontsize: 9,
            fontWeight: FontWeight.w400,
            color: Appcolors.textprimary,
          ),
        ),
      ],
    );
  }
}
