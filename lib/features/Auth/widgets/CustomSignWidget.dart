import 'package:flutter/material.dart';
import 'package:flutter_last_exam/core/const/colors/Appcolors.dart';
import 'package:flutter_last_exam/core/widgets/CustomInputWidget.dart';
import 'package:flutter_last_exam/core/widgets/CustomTextWidget.dart';

class CustomsignWidget extends StatelessWidget {
  const CustomsignWidget({
    super.key,
    required this.usernameController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Customtextwidget(
          text: 'Username or Email',
          fontsize: 12,
          fontWeight: FontWeight.w500,
          color: Appcolors.background,
        ),
        CustomInputWidget(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your username or email';
            } else if (!value.contains('@gmail.com')) {
              return 'Please enter a valid email';
            }
            return null;
          },
          hintText: 'Enter your email...',
          controller: usernameController,
        ),
        SizedBox(height: 20),
        Customtextwidget(
          text: 'Password',
          fontsize: 12,
          fontWeight: FontWeight.w500,
          color: Appcolors.background,
        ),
        CustomInputWidget(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            } else if (value.length < 6) {
              return 'Password must be at least 6 characters';
            }
            return null;
          },
          hintText: 'Enter your password...',
          controller: passwordController,
        ),
        SizedBox(height: 20),
        Customtextwidget(
          text: 'Confirm Password',
          fontsize: 12,
          fontWeight: FontWeight.w500,
          color: Appcolors.background,
        ),
        CustomInputWidget(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            } else if (value.length < 6) {
              return 'Password must be at least 6 characters';
            } else if (value != passwordController.text) {
              return 'Passwords do not match';
            }
            return null;
          },
          hintText: 'Enter your password...',
          controller: confirmPasswordController,
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
