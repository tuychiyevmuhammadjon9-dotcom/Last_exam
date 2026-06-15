import 'package:flutter/material.dart';
import 'package:flutter_last_exam/core/const/colors/Appcolors.dart';
import 'package:flutter_last_exam/core/const/icons/Appicons.dart';
import 'package:flutter_last_exam/core/widgets/CustomInputWidget.dart';
import 'package:flutter_last_exam/core/widgets/CustomTapwidet.dart';
import 'package:flutter_last_exam/core/widgets/CustomTextWidget.dart';
import 'package:flutter_svg/svg.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController usernameController = TextEditingController();
  @override
  void dispose() {
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.background,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      Appicons.left,
                      width: 11,
                      height: 11,
                    ),
                  ),
                  SizedBox(width: MediaQuery.sizeOf(context).width * 0.2),
                  Customtextwidget(
                    text: 'Forgotten Password',
                    fontsize: 15,
                    fontWeight: FontWeight.bold,
                    color: Appcolors.textprimary,
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Customtextwidget(
              text: 'Forgot Password ?',
              fontsize: 15,
              fontWeight: FontWeight.bold,
              color: Appcolors.white,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Customtextwidget(
                textalign: TextAlign.center,
                text:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
                fontsize: 9,
                fontWeight: FontWeight.w400,
                color: Appcolors.white,
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(color: Appcolors.primary),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Customtextwidget(
                      text: 'Enter your email address',
                      fontsize: 12,
                      fontWeight: FontWeight.w500,
                      color: Appcolors.background,
                    ),
                    SizedBox(height: 7),
                    CustomInputWidget(
                      hintText: 'Username or Email',
                      controller: usernameController,
                    ),
                    SizedBox(height: 20),

                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            CustomTapwidget(text: 'Continue', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
