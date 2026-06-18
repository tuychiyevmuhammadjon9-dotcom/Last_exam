import 'package:flutter/material.dart';
import 'package:flutter_last_exam/core/const/colors/Appcolors.dart';
import 'package:flutter_last_exam/core/router/app_router.dart';
import 'package:flutter_last_exam/core/widgets/CustomTapwidet.dart';
import 'package:flutter_last_exam/features/SetUp/widgets/AgePickerWidget.dart';
import 'package:flutter_last_exam/features/SetUp/widgets/CustomAppbarSetup.dart';
import 'package:flutter_last_exam/features/SetUp/widgets/CustomTitleWidget.dart';

class OldScreen extends StatefulWidget {
  const OldScreen({super.key});

  @override
  State<OldScreen> createState() => _OldScreenState();
}

class _OldScreenState extends State<OldScreen> {
  int age = 1;

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
            text: 'How Old Are You?',
            color: Appcolors.primary,
          ),
          SizedBox(height: 140),

          AgePickerWidget(
            age: age,
            pageController: pageController,
            onPageChanged: (value) {
              setState(() {
                age = value + 1;
              });
            },
          ),
          Spacer(),
          CustomTapwidget(
            text: 'Continue',
            onTap: () {
              Navigator.pushNamed(context, AppPages.weight);
            },
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}



// Stack(
//             children: [
//               RulerPicker(
//                 rulerBackgroundColor: Appcolors.primary,
//                 ranges: [RulerRange(begin: 7, end: 70, scale: 1)],
//                 onValueChanged: (value) {
//                   setState(() {
//                     age = value.toInt();
//                   });
//                 },
//                 width: MediaQuery.sizeOf(context).width,
//                 height: 60,
//                 onBuildRulerScaleText: (index, value) {
//                   return value.toString();
//                 },
//               ),
//               // Positioned(
//               //   width: 65,
//               //   child: Container(
//               //     height: 70,
//               //     width: 65,
//               //     decoration: BoxDecoration(
//               //       border: Border(
//               //         right: BorderSide(color: Appcolors.white, width: 1),
//               //         left: BorderSide(color: Appcolors.white, width: 1),
//               //       ),
//               //     ),
//               //   ),
//               // ),
//             ],
//           ),