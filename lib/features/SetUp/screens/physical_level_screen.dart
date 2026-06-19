import 'package:flutter/material.dart';
import 'package:flutter_last_exam/core/const/colors/Appcolors.dart';
import 'package:flutter_last_exam/core/router/app_router.dart';
import 'package:flutter_last_exam/core/widgets/CustomTapwidet.dart';
import 'package:flutter_last_exam/core/widgets/CustomTextWidget.dart';
import 'package:flutter_last_exam/features/SetUp/widgets/CustomAppbarSetup.dart';
import 'package:flutter_last_exam/features/SetUp/widgets/CustomTitleWidget.dart';

class PhysicalLevelScreen extends StatefulWidget {
  const PhysicalLevelScreen({super.key});

  @override
  State<PhysicalLevelScreen> createState() => _PhysicalLevelScreenState();
}

class _PhysicalLevelScreenState extends State<PhysicalLevelScreen> {
  List<String> physicalLevels = ['Beginner', 'Intermediate', 'Advanced'];
  int currentIndex = -1;
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
            text: 'What Is Your physical level?',
            color: Appcolors.background,
            textcolor: Appcolors.white,
          ),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: List.generate(physicalLevels.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 30),
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: currentIndex == index
                          ? Appcolors.textprimary
                          : Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Customtextwidget(
                        text: physicalLevels[index],
                        fontsize: 20,
                        fontWeight: FontWeight.w500,
                        color: currentIndex == index
                            ? Appcolors.background
                            : Appcolors.dotcolor,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          Spacer(),
          CustomTapwidget(
            text: 'Continue',
            onTap: () {
              Navigator.pushNamed(context, AppPages.home);
            },
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
