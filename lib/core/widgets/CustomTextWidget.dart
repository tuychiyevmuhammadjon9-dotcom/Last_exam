import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_last_exam/core/const/colors/Appcolors.dart';
import 'package:google_fonts/google_fonts.dart';

class Customtextwidget extends StatelessWidget {
  const Customtextwidget({
    this.fontWeight,
    super.key,
    required this.text,
    required this.fontsize,
    this.color,
    this.textalign,
  });
  final String text;
  final double fontsize;
  final Color? color;
  final dynamic textalign;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: 3,
      textAlign: textalign,
      text,
      style: GoogleFonts.poppins(
        fontSize: fontsize,
        fontWeight: fontWeight ?? FontWeight.bold,
        color: color ?? Appcolors.white,
      ),
    );
  }
}
