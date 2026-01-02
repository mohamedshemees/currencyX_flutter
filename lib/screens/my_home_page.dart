import 'package:currencyx/domain/CurrencyRepository.dart';
import 'package:currencyx/main.dart';
import 'package:currencyx/screens/home_screen_cubit.dart';
import 'package:currencyx/theme/app_colors.dart';
import 'package:currencyx/theme/app_text_style.dart';
import 'package:currencyx/theme/cubit/theme_cubit.dart';
import 'package:currencyx/theme/custom_colors_extension.dart';
import 'package:currencyx/widgets/currency_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => HomeScreenCubit(getIt<CurrencyRepository>()),
        child: BlocBuilder<HomeScreenCubit, HomeScreenState>(
          builder: (context, state) {
            return state.isLoading
                ? CircularProgressIndicator()
                : Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(
                            context,
                          ).extension<CustomColorsExtension>()!.gradientStart,
                          Theme.of(context)
                              .extension<CustomColorsExtension>()!
                              .cardBackgroundColor,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Currency",
                                  style: AppTextStyle.heading1,
                                ),
                                Text(
                                  "Exchange",
                                  style: AppTextStyle.heading1.copyWith(
                                    color: AppColors.accentColor,
                                  ),
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
                            Align(
                              alignment: Alignment.topRight,
                              child: GestureDetector(
                                onTap: () {
                                  if (Theme.of(context).brightness ==
                                      Brightness.dark) {
                                    context.read<ThemeCubit>().updateTheme(
                                      ThemeMode.light,
                                    );
                                  } else {
                                    context.read<ThemeCubit>().updateTheme(
                                      ThemeMode.dark,
                                    );
                                  }
                                },
                                child: Container(
                                  margin: const EdgeInsetsDirectional.only(
                                    end: 8.0,
                                    top: 8.0,
                                  ),
                                  padding: const EdgeInsetsDirectional.all(8),

                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Theme.of(context)
                                        .extension<CustomColorsExtension>()!
                                        .cardBackgroundColor,
                                  ),
                                  child: SvgPicture.asset(
                                    Theme.of(context)
                                        .extension<CustomColorsExtension>()!
                                        .themeIcon,
                                    width: 40,
                                    height: 40,
                                    colorFilter: ColorFilter.mode(
                                      Theme.of(context)
                                          .extension<CustomColorsExtension>()!
                                          .iconColor,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        CurrencyCardWidget(
                          currentCurrency: state.baseCurrency,
                          enabledTextField: true,
                          title: "From",
                          hint: "Enter Amount",
                          onPressed: (String baseCurrency) {
                            context
                                .read<HomeScreenCubit>()
                                .onChangeBaseCurrency(baseCurrency);
                          },
                          result: '',
                          onChangeValue: (String p1) {
                            context.read<HomeScreenCubit>().onChangeAmount(p1);
                          },
                        ),
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
                            onTap: () {
                              context.read<HomeScreenCubit>().onCLickSwap();
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
                        CurrencyCardWidget(
                          currentCurrency: state.targetCurrency,
                          enabledTextField: false,
                          title: "To",
                          hint: "Result",
                          onPressed: (String targetCurrency) {
                            context
                                .read<HomeScreenCubit>()
                                .onChangeTargetCurrency(targetCurrency);
                          },
                          onChangeValue: (String amount) {},
                          result: state.result,
                        ),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
