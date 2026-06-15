// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_last_exam/core/const/colors/Appcolors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomInputWidget extends StatelessWidget {
  const CustomInputWidget({super.key, required this.hintText, this.controller});
  final String hintText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextFormField(
        textAlign: TextAlign.start,
        controller: controller,
        cursorColor: Appcolors.primary,
        cursorWidth: 2,
        cursorErrorColor: Colors.red,
        decoration: InputDecoration(
          focusColor: Appcolors.primary,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Appcolors.primary),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Appcolors.primary),
          ),
          hintTextDirection: TextDirection.ltr,
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Appcolors.textprimary,
          ),
          fillColor: Appcolors.white,
          filled: true,
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Appcolors.primary),
          ),
        ),
      ),
    );
  }
}
