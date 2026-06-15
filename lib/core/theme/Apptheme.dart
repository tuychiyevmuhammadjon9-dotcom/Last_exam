import 'package:flutter/material.dart';
import 'package:flutter_last_exam/core/const/colors/Appcolors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    colorScheme: ColorScheme.fromSeed(seedColor: Appcolors.primary),

    textTheme: ThemeData.light().textTheme.apply(
      decoration: TextDecoration.none,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Appcolors.white,
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    textTheme: ThemeData.dark().textTheme.apply(
      decoration: TextDecoration.none,
    ),
  );
}
