import 'package:currencyx/theme/app_fonts.dart';
import 'package:currencyx/theme/custom_colors_extension.dart';
import 'package:flutter/material.dart';

ThemeData getLightTheme() {
  return ThemeData(
    extensions: const [CustomColorsExtension.light],
    fontFamily: AppFonts.roboto,
    brightness: Brightness.light,
  );
}
