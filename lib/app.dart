import 'package:currencyx/domain/AppThemeRepository.dart';
import 'package:currencyx/main.dart';
import 'package:currencyx/screens/my_home_page.dart';
import 'package:currencyx/theme/cubit/theme_cubit.dart';
import 'package:currencyx/theme/theme_data_dark.dart';
import 'package:currencyx/theme/theme_data_light.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit(
          getIt<AppThemeRepository>()
        )),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: getLightTheme(),
            darkTheme: getDarkTheme(),
            themeMode: state is ThemeInitial
                 ? ThemeMode.system
                : state is ThemeLight
                ? ThemeMode.light
                : ThemeMode.dark
            ,
            home: const MyHomePage(),
          );
        },
      ),
    );
  }
}
