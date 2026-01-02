import 'package:currencyx/theme/app_colors.dart';
import 'package:currencyx/theme/app_text_style.dart';
import 'package:currencyx/theme/cubit/theme_cubit.dart';
import 'package:currencyx/theme/custom_colors_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderWidget extends StatelessWidget {
  final ThemeState theme;

  const HeaderWidget({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Column(
          children: [
            Text("Currency", style: AppTextStyle.heading1),
            Text(
              "Exchange",
              style: AppTextStyle.heading1.copyWith(
                color: AppColors.accentColor,
              ),
            ),
            const Text(
              "Real-time conversion rates",
              style: TextStyle(
                fontSize: 12,
                color: AppColors.subtleTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: () {
              if (theme is ThemeDark) {
                context.read<ThemeCubit>().setTheme("LIGHT");
              } else {
                context.read<ThemeCubit>().setTheme("DARK");
              }
            },
            child: Container(
              margin: const EdgeInsetsDirectional.only(end: 8.0, top: 8.0),
              padding: const EdgeInsetsDirectional.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(
                  context,
                ).extension<CustomColorsExtension>()!.cardBackgroundColor,
              ),
              child: SvgPicture.asset(
                Theme.of(context).extension<CustomColorsExtension>()!.themeIcon,
                width: 40,
                height: 40,
                colorFilter: ColorFilter.mode(
                  Theme.of(
                    context,
                  ).extension<CustomColorsExtension>()!.iconColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
