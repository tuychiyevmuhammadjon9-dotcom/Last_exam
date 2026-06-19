import 'package:flutter/material.dart';
import 'package:flutter_last_exam/core/const/colors/Appcolors.dart';
import 'package:flutter_last_exam/core/const/images/Appimages.dart';
import 'package:flutter_last_exam/core/widgets/CustomTextWidget.dart';

class CustomhomeContainer extends StatelessWidget {
  const CustomhomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Appcolors.primary,
      padding: const EdgeInsets.all(20),
      child: Container(
        height: 130,
        decoration: BoxDecoration(
          color: Appcolors.background,
          borderRadius: BorderRadius.circular(16),
        ),
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Customtextwidget(
                      text: "Weekly\nChallenge",
                      fontsize: 22,
                      fontWeight: FontWeight.bold,
                      color: Appcolors.textprimary,
                    ),
                    SizedBox(height: 6),
                    Customtextwidget(
                      text: "Plank With Hip Twist",
                      fontsize: 12,
                      color: Appcolors.white,
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Expanded(
              flex: 5,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
                ),
                child: Center(
                  child: Image.asset(Appimages.woman3, fit: BoxFit.contain),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
