import 'package:currencyx/models/country.dart';
import 'package:currencyx/theme/app_colors.dart';
import 'package:currencyx/theme/custom_colors_extension.dart';
import 'package:flutter/material.dart';

class CountriesDropdownWidget extends StatelessWidget {
  final void Function(String) onPressed;
  final String currentCurrency;

  const CountriesDropdownWidget({
    super.key,
    required this.onPressed,
    required this.currentCurrency,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(
          context,
        ).extension<CustomColorsExtension>()!.cardBackgroundColor,
        border: Border.all(color: AppColors.spinnerBorderColor, width: .5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<Country>(
        value: countriesMap[currentCurrency],
        isExpanded: true,
        itemHeight: null,
        items: countries.map((Country country) {
          return DropdownMenuItem<Country>(
            value: country,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      country.flag,
                      fit: BoxFit.cover,
                      width: 40,
                      height: 40,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          country.abbreviation,
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(
                              context,
                            ).extension<CustomColorsExtension>()!.textColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          country.name,
                          style: TextStyle(
                            fontSize: 16,
                            overflow: TextOverflow.ellipsis,
                            color: Theme.of(
                              context,
                            ).extension<CustomColorsExtension>()!.subTextColor,
                          ),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
        onChanged: (Country? value) {
          onPressed(value!.abbreviation);
        },
      ),
    );
  }
}
