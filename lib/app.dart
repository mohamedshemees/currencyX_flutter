import 'package:currencyx/app_colors.dart';
import 'package:currencyx/screens/my_home_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.accentColor),
        scaffoldBackgroundColor: AppColors.backgroundColor,
      ),
      home: const MyHomePage(),
    );
  }
}
