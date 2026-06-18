import 'package:flutter/material.dart';
import 'package:flutter_last_exam/core/const/colors/Appcolors.dart';
import 'package:flutter_last_exam/core/const/images/Appimages.dart';
import 'package:flutter_last_exam/core/router/app_router.dart';
import 'package:flutter_last_exam/core/widgets/CustomTapwidet.dart';
import 'package:flutter_last_exam/core/widgets/CustomTextWidget.dart';

class SetupScreen extends StatefulWidget {
  const SetupScreen({super.key});

  @override
  State<SetupScreen> createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.background,
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Image.asset(
              Appimages.setup,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Customtextwidget(
              textalign: TextAlign.center,
              text: 'Consistency Is the Key To progress. Don\'t Give Up!',
              fontsize: 22,
              fontWeight: FontWeight.bold,
              color: Appcolors.textprimary,
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(color: Appcolors.primary),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Customtextwidget(
                    textalign: TextAlign.center,
                    text:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
                    fontsize: 11,
                    fontWeight: FontWeight.w400,
                    color: Appcolors.background,
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
          CustomTapwidget(
            text: 'Next',
            onTap: () {
              Navigator.pushNamed(context, AppPages.gender);
            },
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
