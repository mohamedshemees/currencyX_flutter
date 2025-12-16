import 'package:currencyx/app_colors.dart';
import 'package:currencyx/models/country.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountriesDropdownWidget extends StatefulWidget {
  const CountriesDropdownWidget({super.key});

  @override
  State<CountriesDropdownWidget> createState() =>
      _CountriesDropdownWidgetState();
}

class _CountriesDropdownWidgetState extends State<CountriesDropdownWidget> {
  late Country _selectedCountry;

  @override
  void initState() {
    super.initState();
    _selectedCountry = countries.first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.spinnerBorderColor, width: .5,),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<Country>(
        value: _selectedCountry,
        isExpanded: true,
        itemHeight: null,
        underline: Container(),
        items: countries.map((Country country) {
          return DropdownMenuItem<Country>(
            value: country,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: SvgPicture.asset(
                        country.flag,
                        width: 40,
                        height: 40),
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
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          country.name,
                          style: TextStyle(
                            fontSize: 16,
                            overflow: TextOverflow.ellipsis,
                            color: AppColors.subtleTextColor,
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
        onChanged: (Country? newValue) {
          if (newValue != null) {
            setState(() {
              _selectedCountry = newValue;
            });
          }
        },
      ),
    );
  }
}
