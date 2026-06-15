// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_last_exam/core/const/colors/Appcolors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomInputWidget extends StatelessWidget {
  const CustomInputWidget({
    super.key,
    required this.hintText,
    this.controller,
    this.obscureText = false,
    this.validator,
  });
  final String hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextFormField(
        obscureText: obscureText,
        textAlign: TextAlign.start,
        controller: controller,
        cursorColor: Appcolors.primary,
        cursorWidth: 2,
        cursorErrorColor: Colors.red,
        validator: validator,
        decoration: InputDecoration(
          focusColor: Appcolors.primary,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Appcolors.primary),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.red),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Appcolors.primary),
          ),
          hintTextDirection: TextDirection.ltr,
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Appcolors.black,
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
