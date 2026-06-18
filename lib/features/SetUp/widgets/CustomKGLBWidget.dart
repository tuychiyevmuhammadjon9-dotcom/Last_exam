import 'package:flutter/material.dart';
import 'package:flutter_last_exam/core/const/colors/Appcolors.dart';
import 'package:flutter_last_exam/core/widgets/CustomTextWidget.dart';

class CustomKGLBWIdget extends StatelessWidget {
  const CustomKGLBWIdget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Appcolors.textprimary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Customtextwidget(
                text: 'KG',
                fontsize: 20,
                fontWeight: FontWeight.bold,
                color: Appcolors.background,
              ),
              Container(width: 3, height: 30, color: Appcolors.background),
              Customtextwidget(
                text: 'LB',
                fontsize: 20,
                fontWeight: FontWeight.bold,
                color: Appcolors.background,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
