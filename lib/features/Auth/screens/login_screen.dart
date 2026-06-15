import 'package:flutter/material.dart';
import 'package:flutter_last_exam/core/const/colors/Appcolors.dart';
import 'package:flutter_last_exam/core/const/icons/Appicons.dart';
import 'package:flutter_last_exam/core/const/images/Appimages.dart';
import 'package:flutter_last_exam/core/router/app_router.dart';
import 'package:flutter_last_exam/core/widgets/CustomInputWidget.dart';
import 'package:flutter_last_exam/core/widgets/CustomTapwidet.dart';
import 'package:flutter_last_exam/core/widgets/CustomTextWidget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toastification/toastification.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formkey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      Appimages.google,
      Appimages.facebook,
      Appimages.fingerprint,
    ];
    return Scaffold(
      backgroundColor: Appcolors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  SvgPicture.asset(Appicons.left, width: 11, height: 11),
                  SizedBox(width: MediaQuery.sizeOf(context).width * 0.35),
                  Customtextwidget(
                    text: 'Log In',
                    fontsize: 15,
                    fontWeight: FontWeight.bold,
                    color: Appcolors.textprimary,
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Customtextwidget(
              text: 'Welcome',
              fontsize: 14,
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
            SizedBox(height: 25),
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
                      text: 'Username or Email',
                      fontsize: 12,
                      fontWeight: FontWeight.w500,
                      color: Appcolors.background,
                    ),
                    SizedBox(height: 7),
                    CustomInputWidget(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username or email';
                        } else if (!value.contains('@gmail.com')) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                      hintText: 'Username or Email',
                      controller: usernameController,
                    ),
                    SizedBox(height: 20),
                    Customtextwidget(
                      text: 'Password',
                      fontsize: 12,
                      fontWeight: FontWeight.w500,
                      color: Appcolors.background,
                    ),
                    SizedBox(height: 7),
                    CustomInputWidget(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                      hintText: 'Password',
                      controller: passwordController,
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AppPages.forgotpassword,
                            );
                          },
                          child: Customtextwidget(
                            textalign: TextAlign.end,
                            text: 'Forgot Password?',
                            fontsize: 10,
                            fontWeight: FontWeight.w500,
                            color: Appcolors.background,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            CustomTapwidget(
              text: 'Log In',
              onTap: () {
                if (formkey.currentState!.validate()) {
                  Navigator.pushNamed(context, AppPages.forgotpassword);
                } else {
                  Toastification().show(
                    context: context,
                    title: Customtextwidget(
                      text: 'Please enter your username or email',
                      fontsize: 12,
                      fontWeight: FontWeight.w500,
                      color: Appcolors.white,
                    ),
                    type: ToastificationType.error,
                    alignment: Alignment.topCenter,
                    autoCloseDuration: const Duration(seconds: 3),
                  );
                }
              },
            ),
            SizedBox(height: 20),
            Customtextwidget(
              text: 'or sign up with',
              fontsize: 9,
              fontWeight: FontWeight.w500,
              color: Appcolors.white,
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                images.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Image.asset(images[index], width: 30, height: 30),
                ),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Customtextwidget(
                  text: 'Don\'t have an account?',
                  fontsize: 9,
                  fontWeight: FontWeight.w400,
                  color: Appcolors.white,
                ),
                SizedBox(width: 5),
                Customtextwidget(
                  text: 'Sign Up',
                  fontsize: 9,
                  fontWeight: FontWeight.w400,
                  color: Appcolors.textprimary,
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
