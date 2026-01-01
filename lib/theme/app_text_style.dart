
import 'package:currencyx/theme/app_fonts.dart';
import 'package:flutter/material.dart';

class AppTextStyle{
  AppTextStyle._();
  static const heading1 = TextStyle(
    fontFamily: AppFonts.roboto,
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );
  static const bodyText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );
}