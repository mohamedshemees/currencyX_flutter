import 'package:currencyx/app_colors.dart';
import 'package:currencyx/widgets/base_currency_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient:  LinearGradient(colors: [
            AppColors.gradientStart,
            AppColors.gradientEnd,
          ],begin: Alignment.topCenter,end: Alignment.bottomCenter),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Currency"
              , style: TextStyle(
                  fontSize: 32,
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("Exchange"
                , style: TextStyle(
                  fontSize: 32,
                  color: AppColors.accentColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("Real-time conversion rates"
                , style: TextStyle(
                  fontSize: 8,
                  color: AppColors.subtleTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              BaseCurrencyWidget(),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: AppColors.accentColor
                ),
                child: SvgPicture.asset("assets/ic_swap.svg",
                    colorFilter:ColorFilter.mode(AppColors.cardBackgroundColor, BlendMode.srcIn) ,
                    width: 40,
                    height: 40),
              ),
              BaseCurrencyWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
