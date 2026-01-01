
import 'package:currencyx/theme/app_colors.dart';
import 'package:currencyx/theme/app_fonts.dart';
import 'package:flutter/material.dart';

ThemeData getDarkTheme() {
  return ThemeData(
    primarySwatch: Colors.blue,
    fontFamily: AppFonts.roboto,
    primaryColor: AppColors.onAccentColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.accentColor,
      brightness: Brightness.dark,
    ),

    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
