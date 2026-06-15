import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_last_exam/core/const/colors/Appcolors.dart';
import 'package:flutter_last_exam/core/widgets/CustomTextWidget.dart';

class CustomTapwidget extends StatelessWidget {
  const CustomTapwidget({super.key, required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            height: 35,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Appcolors.white),
            ),
            child: Center(
              child: Customtextwidget(
                text: text,
                fontsize: 13,
                fontWeight: FontWeight.bold,
                color: Appcolors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
