import 'package:currencyx/theme/app_colors.dart';
import 'package:currencyx/theme/app_fonts.dart';
import 'package:currencyx/theme/custom_colors_extension.dart';
import 'package:currencyx/widgets/countries_dropdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CurrencyCardWidget extends StatelessWidget {
  final String title;
  final String hint;
  final bool enabledTextField;
  final String result;
  final String currentCurrency;
  final void Function(String) onPressed;
  final void Function(String) onChangeValue;

  const CurrencyCardWidget({
    super.key,
    required this.title,
    required this.hint,
    required this.enabledTextField,
    required this.result,
    required this.onPressed,
    required this.onChangeValue,
    required this.currentCurrency,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(
            context,
          ).extension<CustomColorsExtension>()!.cardBackgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Text(title),
                  Expanded(child: CountriesDropdownWidget(
                    currentCurrency:currentCurrency,
                    onPressed: onPressed,
                  )),
                ],
              ),
              enabledTextField
                  ? TextField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
                ],
                onChanged: ((value)=>{
                  onChangeValue(value)
                }),
                      enabled: enabledTextField,
                      decoration: InputDecoration(hintText: hint),
                    )
                  : Text(
                  result,
                style: TextStyle(
                  fontFamily: AppFonts.roboto,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.accentColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
