import 'package:flutter/material.dart';
import 'package:flutter_last_exam/core/const/colors/Appcolors.dart';
import 'package:flutter_last_exam/core/widgets/CustomTextWidget.dart';
import 'package:flutter_svg/svg.dart';

class CustomcategoryWidget extends StatelessWidget {
  const CustomcategoryWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.isSelected,
  });
  final String title;
  final String icon;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            height: isSelected ? 30 : 25,
            width: isSelected ? 30 : 25,
            colorFilter: ColorFilter.mode(
              isSelected ? Appcolors.textprimary : Appcolors.primary,
              BlendMode.srcIn,
            ),
          ),
          Customtextwidget(
            text: title,
            fontsize: 13,
            fontWeight: FontWeight.w400,
            color: isSelected ? Appcolors.textprimary : Appcolors.primary,
          ),
        ],
      ),
    );
  }
}
