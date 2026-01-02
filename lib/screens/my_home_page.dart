import 'package:currencyx/domain/CurrencyRepository.dart';
import 'package:currencyx/main.dart';
import 'package:currencyx/screens/home_screen_cubit.dart';
import 'package:currencyx/theme/app_colors.dart';
import 'package:currencyx/theme/custom_colors_extension.dart';
import 'package:currencyx/widgets/conversion_view_widget.dart';
import 'package:currencyx/widgets/exchange_rate_widget.dart';
import 'package:currencyx/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: BlocProvider(
          create: (context) => HomeScreenCubit(getIt<CurrencyRepository>()),
          child: BlocBuilder<HomeScreenCubit, HomeScreenState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    clipBehavior: Clip.none,
                    child: Stack(
                      children: [
                        Container(
                          height: constraints.maxHeight,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Theme.of(context)
                                    .extension<CustomColorsExtension>()!
                                    .gradientStart,
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
                              const HeaderWidget(),
                              const ConversionViewWidget(),
                              ExchangeRateWidget(
                                onSelectDate: (selectedDate) {
                                  context
                                      .read<HomeScreenCubit>()
                                      .onSelectDate(selectedDate);
                                },
                                firstDate: DateTime(2020),
                                lastDate: DateTime.now(),
                                ratio: state.ratio,
                              ),
                            ],
                          ),
                        ),
                        Container(decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.accentColor.withValues(alpha: .05),
                                blurRadius: 100,
                                spreadRadius: 100,
                                offset: Offset(constraints.maxWidth, 70),
                              ),
                              BoxShadow(
                                color: AppColors.accentColor.withValues(alpha: .05),
                                blurRadius: 100,
                                spreadRadius: 100,
                                offset: Offset(-constraints.maxWidth,constraints.maxHeight),
                              ),
                              BoxShadow(
                                color: AppColors.accentColor.withValues(alpha: .05),
                                blurRadius: 100,
                                spreadRadius: 100,
                                offset: Offset(constraints.maxWidth,constraints.maxHeight/2),
                              )
                            ]
                        ))
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
