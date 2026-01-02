import 'package:currencyx/screens/home_screen_cubit.dart';
import 'package:currencyx/theme/app_colors.dart';
import 'package:currencyx/theme/custom_colors_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExchangeRateWidget extends StatelessWidget {
  final String ratio;
  final Function(DateTime?) onSelectDate;
  final DateTime firstDate;
  final DateTime lastDate;

  const ExchangeRateWidget({
    super.key,
    required this.ratio,
    required this.onSelectDate,
    required this.firstDate,
    required this.lastDate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/ic_stocks.svg",
            width: 40,
            height: 40,
            colorFilter: const ColorFilter.mode(
              AppColors.accentColor,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            ratio,
            style: TextStyle(
              color: Theme.of(context).extension<CustomColorsExtension>()!.subTextColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () async {
              var selectedDate = await showDatePicker(
                context: context,
                firstDate: firstDate,
                lastDate: lastDate,
              );
              onSelectDate(selectedDate);
            },
            child: Image.asset(
              "assets/calendar.png",
              width: 40,
              height: 40,
              color: AppColors.accentColor,
            ),
          ),
        ],
      ),
    );
  }
}
