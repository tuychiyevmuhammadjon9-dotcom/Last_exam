import 'package:flutter/material.dart';
import 'package:flutter_last_exam/core/const/colors/Appcolors.dart';
import 'package:flutter_last_exam/core/const/images/Appimages.dart';
import 'package:flutter_last_exam/core/router/app_router.dart';
import 'package:flutter_last_exam/core/widgets/CustomTapwidet.dart';
import 'package:flutter_last_exam/core/widgets/CustomTextWidget.dart';
import 'package:flutter_last_exam/features/SetUp/widgets/CustomAppbarSetup.dart';
import 'package:flutter_last_exam/features/SetUp/widgets/CustomTitleWidget.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  int selectedIndex = 0;
  List<String> images = [Appimages.male, Appimages.female];
  List<String> gender = ['Male', 'Female'];
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          CustomTitleWIdget(
            textcolor: Appcolors.background,
            text: 'What\'s Your Gender',
            color: Appcolors.primary,
          ),
          SizedBox(height: 20),
          Column(
            children: List.generate(gender.length, (index) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(25),
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: selectedIndex != index
                              ? Appcolors.white
                              : Appcolors.textprimary,
                          width: 0.5,
                        ),
                        shape: BoxShape.circle,
                        color: selectedIndex == index
                            ? Appcolors.textprimary
                            : Appcolors.white.withAlpha(15),
                      ),
                      child: Image.asset(
                        images[index],
                        width: 40,
                        height: 40,
                        fit: BoxFit.contain,
                        color: selectedIndex == index
                            ? Appcolors.background
                            : Appcolors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Customtextwidget(
                    text: gender[index],
                    fontsize: 16,
                    fontWeight: FontWeight.bold,
                    color: Appcolors.white,
                  ),
                  SizedBox(height: 20),
                ],
              );
            }),
          ),
          SizedBox(height: 20),
          CustomTapwidget(
            text: 'Continue',
            onTap: () {
              Navigator.pushNamed(context, AppPages.old);
            },
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
