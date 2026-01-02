import 'package:currencyx/domain/CurrencyRepository.dart';
import 'package:currencyx/main.dart';
import 'package:currencyx/screens/home_screen_cubit.dart';
import 'package:currencyx/theme/custom_colors_extension.dart';
import 'package:currencyx/widgets/conversion_view_widget.dart';
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
          create: (context) =>
              HomeScreenCubit(getIt<CurrencyRepository>())..getCurrencies(),
          child: BlocBuilder<HomeScreenCubit, HomeScreenState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return SingleChildScrollView(
                child: Container(
                  width: double.infinity,
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
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [HeaderWidget(), ConversionViewWidget()],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
