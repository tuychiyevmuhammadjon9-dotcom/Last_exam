import 'package:flutter/material.dart';
import 'package:flutter_last_exam/core/const/colors/Appcolors.dart';
import 'package:flutter_last_exam/core/router/app_router.dart';
import 'package:flutter_last_exam/core/widgets/CustomTapwidet.dart';
import 'package:flutter_last_exam/features/SetUp/widgets/CustomAppbarSetup.dart';
import 'package:flutter_last_exam/features/SetUp/widgets/CustomTitleWidget.dart';
import 'package:flutter_last_exam/features/SetUp/widgets/HeightPickerWidget.dart';

class HeightScreen extends StatefulWidget {
  const HeightScreen({super.key});

  @override
  State<HeightScreen> createState() => _HeightScreenState();
}

class _HeightScreenState extends State<HeightScreen> {
  int height = 150;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppbarSetup(
          ontap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          CustomTitleWIdget(
            text: 'What Is Your height?',
            color: Appcolors.background,
            textcolor: Appcolors.white,
          ),
          HeightPickerWidget(
            initialHeight: height.toDouble(),
            onChanged: (value) {
              setState(() {
                height = value.toInt();
              });
            },
          ),
          Spacer(),
          CustomTapwidget(
            text: 'Continue',
            onTap: () {
              Navigator.pushNamed(context, AppPages.goal);
            },
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
