import 'package:currencyx/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomColorsExtension {
  final Color textColor;
  final Color iconColor;
  final Color gradientStart;
  final Color gradientEnd;
  final Color cardBackgroundColor;


  CustomColorsExtension._({
    required this.textColor,
    required this.iconColor,
    required this.gradientStart,
    required this.gradientEnd,
    required this.cardBackgroundColor,
  });

  factory CustomColorsExtension._light() {
    return CustomColorsExtension._(
      textColor: AppColors.textColor,
      iconColor: AppColors.iconColor,
      gradientStart: AppColors.gradientStart,
      gradientEnd: AppColors.gradientEnd,
      cardBackgroundColor: AppColors.cardBackgroundColor,
    );
  }

  factory CustomColorsExtension._dark() {
    return CustomColorsExtension._(
        textColor: AppColors.darkTextColor,
        iconColor: AppColors.darkIconColor,
        gradientStart: AppColors.darkGradientStart,
        gradientEnd: AppColors.darkGradientEnd,
        cardBackgroundColor: AppColors.darkCardBackgroundColor,

    );
  }
}

extension CustomColors on ThemeData {
  CustomColorsExtension get customColors {
    if (brightness == Brightness.light) {
      return CustomColorsExtension._light();
    } else {
      return CustomColorsExtension._dark();
    }
  }
}
