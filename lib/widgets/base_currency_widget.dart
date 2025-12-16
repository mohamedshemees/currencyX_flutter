import 'package:currencyx/app_colors.dart';
import 'package:currencyx/widgets/countries_dropdown_widget.dart';
import 'package:flutter/material.dart';

class BaseCurrencyWidget extends StatelessWidget {
  const BaseCurrencyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration( 
          color: AppColors.cardBackgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(24))
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Row(children: [
                Text("From"),
                Expanded(child: CountriesDropdownWidget()),
              ]),
              TextField(),
            ],
          ),
        ),
      ),
    );
  }
}
