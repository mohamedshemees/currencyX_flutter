import 'package:currencyx/theme/custom_colors_extension.dart';
import 'package:flutter/material.dart';

ThemeData getDarkTheme() {
  return ThemeData(
    extensions: [CustomColorsExtension.dark],
    brightness: Brightness.dark,
  );
}
