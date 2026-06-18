import 'package:flutter/material.dart';
import 'package:flutter_last_exam/core/const/colors/Appcolors.dart';
import 'package:flutter_last_exam/core/const/icons/Appicons.dart';
import 'package:flutter_last_exam/core/widgets/CustomTextWidget.dart';
import 'package:flutter_svg/svg.dart';

class AgePickerWidget extends StatelessWidget {
  final int age;
  final PageController pageController;
  final ValueChanged<int> onPageChanged;

  const AgePickerWidget({
    super.key,
    required this.age,
    required this.pageController,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 70,
            width: double.infinity,
            decoration: BoxDecoration(color: Appcolors.primary),
            child: PageView.custom(
              controller: pageController,
              onPageChanged: onPageChanged,
              childrenDelegate: SliverChildListDelegate.fixed(
                List.generate(
                  70,
                  (index) => Center(
                    child: Customtextwidget(
                      text: (index + 1).toString(),
                      fontsize: age == index + 1 ? 30 : 16,
                      color: age == index + 1
                          ? Appcolors.white
                          : Appcolors.background,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            width: 60,
            left: MediaQuery.sizeOf(context).width / 2 - 30,
            child: Container(
              height: 70,
              width: 60,
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: Appcolors.white, width: 2),
                  right: BorderSide(color: Appcolors.white, width: 2),
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 100,
            child: Column(
              children: [
                Customtextwidget(
                  text: age.toString(),
                  fontsize: 40,
                  color: Appcolors.white,
                ),
                const SizedBox(height: 20),
                SvgPicture.asset(Appicons.up, height: 20, width: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
