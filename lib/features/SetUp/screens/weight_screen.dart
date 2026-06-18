import 'package:flutter/material.dart';
import 'package:flutter_last_exam/core/const/colors/Appcolors.dart';
import 'package:flutter_last_exam/core/const/icons/Appicons.dart';
import 'package:flutter_last_exam/core/router/app_router.dart';
import 'package:flutter_last_exam/core/widgets/CustomTapwidet.dart';
import 'package:flutter_last_exam/core/widgets/CustomTextWidget.dart';
import 'package:flutter_last_exam/features/SetUp/widgets/CustomAppbarSetup.dart';
import 'package:flutter_last_exam/features/SetUp/widgets/CustomKGLBWidget.dart';
import 'package:flutter_last_exam/features/SetUp/widgets/CustomTitleWidget.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';
import 'package:flutter_svg/svg.dart';

class WeightScreen extends StatefulWidget {
  const WeightScreen({super.key});

  @override
  State<WeightScreen> createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  int weight = 1;
  late PageController pageController;
  @override
  void initState() {
    pageController = PageController(viewportFraction: 0.2);
    super.initState();
  }

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
            textcolor: Appcolors.white,
            text: 'What Is Your Weight?',
            color: Appcolors.background,
          ),
          SizedBox(height: 20),
          CustomKGLBWIdget(),
          SizedBox(height: 20),
          Stack(
            clipBehavior: Clip.none,
            children: [
              RulerPicker(
                marker: SizedBox(),
                rulerBackgroundColor: Appcolors.primary,
                ranges: [RulerRange(begin: 1, end: 200, scale: 1)],
                onValueChanged: (value) {
                  setState(() {
                    weight = value.toInt();
                  });
                },
                width: MediaQuery.sizeOf(context).width,
                height: 60,
                onBuildRulerScaleText: (index, value) {
                  return value.toString();
                },
              ),
              Positioned(
                top: 10,
                width: 3,
                left: MediaQuery.sizeOf(context).width / 2,
                child: Container(
                  width: 3,
                  height: 40,
                  color: Appcolors.textprimary,
                ),
              ),
              Positioned(
                left: MediaQuery.sizeOf(context).width / 2 - 25,
                top: 80,
                child: Column(
                  children: [
                    SvgPicture.asset(Appicons.up, height: 20, width: 20),
                    SizedBox(height: 20),
                    Customtextwidget(
                      text: weight.toString(),
                      fontsize: 40,
                      color: Appcolors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Spacer(),
          CustomTapwidget(
            text: 'Continue',
            onTap: () {
              Navigator.pushNamed(context, AppPages.height);
            },
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
