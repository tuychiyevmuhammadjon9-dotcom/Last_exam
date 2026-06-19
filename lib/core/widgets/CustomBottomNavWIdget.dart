import 'package:flutter/material.dart';
import 'package:flutter_last_exam/core/const/colors/Appcolors.dart';
import 'package:flutter_last_exam/core/const/icons/Appicons.dart';
import 'package:flutter_last_exam/core/router/app_router.dart';
import 'package:flutter_svg/svg.dart';

class Custombottomnavwidget extends StatelessWidget {
  const Custombottomnavwidget({
    super.key,
    required this.currenindex,
    required this.onTap,
  });
  final int currenindex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 20,
      selectedFontSize: 15,
      unselectedFontSize: 13,
      selectedItemColor: Appcolors.textprimary,
      unselectedItemColor: Appcolors.white,
      type: BottomNavigationBarType.fixed,
      currentIndex: currenindex,
      onTap: onTap,
      backgroundColor: Appcolors.primary,
      items: [
        BottomNavigationBarItem(
          icon: Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppPages.home);
              },
              child: SvgPicture.asset(
                Appicons.homebottom,
                width: 20,
                height: 20,
              ),
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Center(
            child: SvgPicture.asset(Appicons.infobottom, width: 20, height: 20),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Center(
            child: SvgPicture.asset(Appicons.starbottom, width: 20, height: 20),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Center(
            child: SvgPicture.asset(Appicons.helpbottom, width: 20, height: 20),
          ),
          label: '',
        ),
      ],
    );
  }
}
