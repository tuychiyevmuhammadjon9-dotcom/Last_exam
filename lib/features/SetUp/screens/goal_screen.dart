import 'package:flutter/material.dart';
import 'package:flutter_last_exam/core/const/colors/Appcolors.dart';
import 'package:flutter_last_exam/core/router/app_router.dart';
import 'package:flutter_last_exam/core/widgets/CustomTapwidet.dart';
import 'package:flutter_last_exam/core/widgets/CustomTextWidget.dart';
import 'package:flutter_last_exam/features/SetUp/widgets/CustomAppbarSetup.dart';
import 'package:flutter_last_exam/features/SetUp/widgets/CustomTitleWidget.dart';

class GoalScreen extends StatefulWidget {
  const GoalScreen({super.key});

  @override
  State<GoalScreen> createState() => _GoalScreenState();
}

class _GoalScreenState extends State<GoalScreen> {
  int currentIndex = -1;
  List<String> goals = [
    'Lose Weight',
    'Gain Weight',
    'Muscle Mass Gain',
    'Shape body',
    'Others',
  ];
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
            text: 'What Is Your Goal?',
            color: Appcolors.background,
            textcolor: Appcolors.white,
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 0.55,
            decoration: BoxDecoration(color: Appcolors.primary),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(goals.length, (index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 15),
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Appcolors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Customtextwidget(
                            text: goals[index],
                            fontsize: 13,
                            fontWeight: FontWeight.w500,
                            color: Appcolors.background,
                          ),
                          Spacer(),
                          Transform.scale(
                            scale: 1.5,
                            child: Checkbox(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.padded,
                              shape: CircleBorder(),
                              value: currentIndex == index,
                              onChanged: (value) {
                                setState(() {
                                  currentIndex = index;
                                });
                              },
                              checkColor: Appcolors.white,
                              activeColor: Appcolors.textprimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          Spacer(),
          CustomTapwidget(
            text: 'Continue',
            onTap: () {
              Navigator.pushNamed(context, AppPages.physicallevel);
            },
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
