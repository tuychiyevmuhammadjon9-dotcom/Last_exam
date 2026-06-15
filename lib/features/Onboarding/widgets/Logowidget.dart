import 'package:flutter/material.dart';
import 'package:flutter_last_exam/core/const/images/Appimages.dart';

class Logowidget extends StatelessWidget {
  const Logowidget({
    super.key,
    this.height,
    this.width,
    this.height2,
    this.width2,
  });
  final double? height;
  final double? width;
  final double? height2;
  final double? width2;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          Appimages.logo,
          width: width ?? 100,
          height: height ?? 50,
          fit: BoxFit.contain,
        ),
        Image.asset(
          Appimages.fitbodylogo,
          width: width2 ?? 130,
          height: height2 ?? 50,
          fit: BoxFit.contain,
        ),
      ],
    );
  }
}
