import 'package:flutter/material.dart';
import 'package:flutter_last_exam/core/const/colors/Appcolors.dart';
import 'package:flutter_last_exam/core/const/icons/Appicons.dart';
import 'package:flutter_last_exam/core/widgets/CustomTextWidget.dart';
import 'package:flutter_svg/svg.dart';

class Customworkoutwidget extends StatelessWidget {
  final String title;
  final String duration;
  final double kcal;
  final bool isFavorite;
  final String imageUrl;
  final Function() onTap;

  const Customworkoutwidget({
    super.key,
    required this.title,
    required this.duration,
    required this.kcal,
    required this.isFavorite,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: MediaQuery.sizeOf(context).width * 0.44,
      decoration: BoxDecoration(
        color: Appcolors.background,
        borderRadius: BorderRadius.circular(16),
        border: BorderDirectional(
          bottom: BorderSide(color: Appcolors.white, width: 1.5),
        ),
      ),
      clipBehavior: Clip.none,
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * 0.16,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Customtextwidget(
                      text: title,
                      fontsize: 14,
                      fontWeight: FontWeight.bold,
                      color: Appcolors.textprimary,
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        SvgPicture.asset(Appicons.time, height: 12, width: 12),
                        SizedBox(width: 4),
                        Customtextwidget(
                          text: duration.toString(),
                          fontsize: 10,
                          fontWeight: FontWeight.w400,
                          color: Appcolors.white,
                        ),
                        Spacer(),
                        SizedBox(width: 8),
                        SvgPicture.asset(Appicons.fire, height: 12, width: 12),
                        SizedBox(width: 4),
                        Customtextwidget(
                          text: kcal.toString(),
                          fontsize: 10,
                          fontWeight: FontWeight.w400,
                          color: Appcolors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 8,
            right: 8,
            child: GestureDetector(
              onTap: onTap,
              child: SvgPicture.asset(
                isFavorite ? Appicons.star : Appicons.colorstar,
                width: 20,
                height: 20,
              ),
            ),
          ),
          Positioned(
            bottom: 35,
            right: 8,
            child: SvgPicture.asset(Appicons.playvideo, height: 25, width: 25),
          ),
        ],
      ),
    );
  }
}
