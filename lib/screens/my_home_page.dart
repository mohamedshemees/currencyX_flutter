import 'package:currencyx/theme/app_colors.dart';
import 'package:currencyx/theme/app_text_style.dart';
import 'package:currencyx/theme/cubit/theme_cubit.dart';
import 'package:currencyx/theme/custom_colors_extension.dart';
import 'package:currencyx/widgets/base_currency_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).customColors.gradientStart,
              Theme.of(context).customColors.cardBackgroundColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "Currency",
                        style: AppTextStyle.heading1,
                      ),
                      Text(
                        "Exchange",
                        style: AppTextStyle.heading1.copyWith(color: AppColors.accentColor),
                      ),
                      Text(
                        "Real-time conversion rates",
                        style: TextStyle(
                          fontSize: 8,
                          color: AppColors.subtleTextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 16.0,top: 16.0),
                  child: SvgPicture.asset(
                    "assets/ic_sun.svg",
                    width: 40,
                    height: 40,
                    colorFilter: ColorFilter.mode(Theme.of(context).customColors.iconColor, BlendMode.srcIn),
                  ),
                ),
              ],
            ),
            BaseCurrencyWidget(),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColors.accentColor,
                    blurRadius: 4,
                    offset: Offset(0, 0),
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: AppColors.accentColor,
              ),
              child: GestureDetector(
                onTap: (){
                  if(Theme.of(context).brightness==Brightness.dark){
                    context.read<ThemeCubit>().updateTheme(ThemeMode.light);
                  }else{
                    context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
                  }
                },
                child: SvgPicture.asset(
                  "assets/ic_swap.svg",
                  colorFilter: ColorFilter.mode(
                    AppColors.cardBackgroundColor,
                    BlendMode.srcIn,
                  ),
                  width: 40,
                  height: 40,
                ),
              ),
            ),
            BaseCurrencyWidget(),
          ],
        ),
      ),
    );
  }
}
