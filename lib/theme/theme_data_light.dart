
import 'package:currencyx/theme/app_colors.dart';
import 'package:currencyx/theme/app_fonts.dart';
import 'package:currencyx/theme/app_text_style.dart';
import 'package:flutter/material.dart';

ThemeData getLightTheme() {
  return ThemeData(
    fontFamily: AppFonts.roboto,
    primaryColor: AppColors.onAccentColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.accentColor,
      brightness: Brightness.light,
    ),
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusColor: AppColors.onAccentColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.accentColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.onAccentColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.gradientStart,
        ),
      ),
      fillColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.focused)) {
          return AppColors.gradientStart;
        }
        return AppColors.onAccentColor;
      }),
      filled: true,
      hintStyle: AppTextStyle.bodyText.copyWith(color: AppColors.subtleTextColor),
    ));
}
