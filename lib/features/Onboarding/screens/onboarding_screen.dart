import 'package:flutter/material.dart';
import 'package:flutter_last_exam/core/const/colors/Appcolors.dart';
import 'package:flutter_last_exam/core/const/icons/Appicons.dart';
import 'package:flutter_last_exam/core/const/images/Appimages.dart';
import 'package:flutter_last_exam/core/router/app_router.dart';
import 'package:flutter_last_exam/core/widgets/CustomTapwidet.dart';
import 'package:flutter_last_exam/features/Onboarding/widgets/CustomOnboardingWidget.dart';
import 'package:flutter_last_exam/features/Onboarding/widgets/Skipwidget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  final PageController pageController = PageController();
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  final List<Map<String, dynamic>> onboardingData = [
    {
      'icon': Appicons.onboarding1,
      'text': 'Start your journey towards a more active lifestyle',
    },
    {
      'icon': Appicons.onboarding2,
      'text': 'Find nutrition tips that fit your lifestyle',
    },
    {
      'icon': Appicons.onboarding3,
      'text': 'A community for you, challenge yourself',
    },
  ];

  final List<String> images = [Appimages.fit2, Appimages.fit3, Appimages.fit4];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: onboardingData.length,
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(images[index]),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10, top: 20),
                  child: index == onboardingData.length - 1
                      ? SizedBox()
                      : Skipwidget(
                          onTap: () {
                            Navigator.pushNamed(context, AppPages.login);
                          },
                        ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.35),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(color: Appcolors.primary),
                  child: Column(
                    children: [
                      CustomOnboardingwidget(
                        icon: onboardingData[index]['icon'],
                        text: onboardingData[index]['text'],
                      ),
                      SizedBox(height: 7),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(images.length, (index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            width: 15,
                            height: 3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: index == currentIndex
                                  ? Appcolors.white
                                  : Appcolors.dotcolor,
                            ),
                          );
                        }),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                CustomTapwidget(
                  text: index == onboardingData.length - 1
                      ? 'Get Started'
                      : 'Next',
                  onTap: () {
                    if (index == onboardingData.length - 1) {
                      Navigator.pushNamed(context, AppPages.login);
                    } else {
                      pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                      setState(() {});
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
