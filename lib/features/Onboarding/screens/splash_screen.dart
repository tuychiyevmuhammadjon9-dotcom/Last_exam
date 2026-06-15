import 'package:flutter/material.dart';
import 'package:flutter_last_exam/core/const/colors/Appcolors.dart';
import 'package:flutter_last_exam/core/router/app_router.dart';
import 'package:flutter_last_exam/features/Onboarding/widgets/Logowidget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, AppPages.welcome);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.background,
      body: Center(child: Logowidget()),
    );
  }
}
