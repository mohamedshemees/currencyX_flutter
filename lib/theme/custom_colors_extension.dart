import 'package:currencyx/theme/app_colors.dart';
import 'package:flutter/material.dart';
@immutable
class CustomColorsExtension extends ThemeExtension<CustomColorsExtension> {
  final Color textColor;
  final Color subTextColor;
  final Color iconColor;
  final Color gradientStart;
  final Color gradientEnd;
  final Color cardBackgroundColor;
  final String themeIcon;

  const CustomColorsExtension({
    required this.textColor,
    required this.subTextColor,
    required this.iconColor,
    required this.gradientStart,
    required this.gradientEnd,
    required this.cardBackgroundColor,
    required this.themeIcon,
  });

  static const light = CustomColorsExtension(
    textColor: AppColors.textColor,
    subTextColor: AppColors.subtleTextColor,
    iconColor: AppColors.iconColor,
    gradientStart: AppColors.gradientStart,
    gradientEnd: AppColors.gradientEnd,
    cardBackgroundColor: AppColors.cardBackgroundColor,
    themeIcon: 'assets/ic_sun.svg',
  );

  static const dark = CustomColorsExtension(
    textColor: AppColors.darkTextColor,
    subTextColor: AppColors.darkSubtleTextColor,
    iconColor: AppColors.darkIconColor,
    gradientStart: AppColors.darkGradientStart,
    gradientEnd: AppColors.darkGradientEnd,
    cardBackgroundColor: AppColors.darkCardBackgroundColor,
    themeIcon: 'assets/ic_moon.svg',
  );

  @override
  CustomColorsExtension copyWith({
    Color? textColor,
    Color? iconColor,
    Color? gradientStart,
    Color? gradientEnd,
    Color? cardBackgroundColor,
  }) {
    return CustomColorsExtension(
      textColor: textColor ?? this.textColor,
      subTextColor: subTextColor,
      iconColor: iconColor ?? this.iconColor,
      gradientStart: gradientStart ?? this.gradientStart,
      gradientEnd: gradientEnd ?? this.gradientEnd,
      cardBackgroundColor: cardBackgroundColor ?? this.cardBackgroundColor,
      themeIcon: themeIcon,
    );
  }

  @override
  CustomColorsExtension lerp(
      covariant ThemeExtension<CustomColorsExtension>? other,
      double t,
      ) {
    if (other is! CustomColorsExtension) return this;

    return CustomColorsExtension(
      textColor: Color.lerp(textColor, other.textColor, t)!,
      subTextColor: Color.lerp(subTextColor, other.subTextColor, t)!,
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
      gradientStart: Color.lerp(gradientStart, other.gradientStart, t)!,
      gradientEnd: Color.lerp(gradientEnd, other.gradientEnd, t)!,
      cardBackgroundColor: Color.lerp(cardBackgroundColor, other.cardBackgroundColor, t)!,
      themeIcon: themeIcon,
    );
  }
}
