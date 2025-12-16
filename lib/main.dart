import 'package:currencyx/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

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

class MyHomePage extends StatelessWidget {
  const MyHomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient:  LinearGradient(colors: [
            AppColors.gradientEnd,
            AppColors.gradientStart,
          ]),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Currency"
              , style: TextStyle(
                  fontSize: 32,
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("Exchange"
                , style: TextStyle(
                  fontSize: 32,
                  color: AppColors.accentColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("Real-time conversion rates"
                , style: TextStyle(
                  fontSize: 8,
                  color: AppColors.subtleTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              BaseCurrencyWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

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
    return DropdownButton<Country>(
      value: _selectedCountry,
      isExpanded: true,
      itemHeight: null,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
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
    );
  }
}

class Country {
  String abbreviation;
  String flag;
  String name;

  Country({required this.abbreviation, required this.flag, required this.name});
}

var countries = [
  Country(
    abbreviation: "AUD",
    flag: "assets/au.svg",
    name: "Australian Dollar",
  ),
  Country(abbreviation: "BGN", flag: "assets/gb.svg", name: "Bulgarian Lev"),
  Country(abbreviation: "BRL", flag: "assets/br.svg", name: "Brazilian Real"),
  Country(abbreviation: "CAD", flag: "assets/ca.svg", name: "Canadian Dollar"),
  Country(abbreviation: "CHF", flag: "assets/sek.svg", name: "Swiss Franc"),
  Country(abbreviation: "CNY", flag: "assets/cn.svg", name: "Chinese Yuan"),
  Country(
    abbreviation: "CZK",
    flag: "assets/cz.svg",
    name: "Czech Republic Koruna",
  ),
  Country(
    abbreviation: "DKK",
    flag: "assets/denemark.svg",
    name: "Danish Krone",
  ),
  Country(abbreviation: "EUR", flag: "assets/eu.svg", name: "Euro"),
  Country(abbreviation: "GBP", flag: "assets/gb.svg", name: "British Pound"),
  Country(abbreviation: "HKD", flag: "assets/hk.svg", name: "Hong Kong Dollar"),
  Country(abbreviation: "HRK", flag: "assets/cr.svg", name: "Croatian Kuna"),
  Country(abbreviation: "HUF", flag: "assets/hu.svg", name: "Hungarian Forint"),
  Country(
    abbreviation: "IDR",
    flag: "assets/id.svg",
    name: "Indonesian Rupiah",
  ),
  Country(abbreviation: "INR", flag: "assets/in.svg", name: "Indian Rupee"),
  Country(abbreviation: "ISK", flag: "assets/is.svg", name: "Icelandic Króna"),
  Country(abbreviation: "JPY", flag: "assets/jp.svg", name: "Japanese Yen"),
  Country(abbreviation: "KRW", flag: "assets/kr.svg", name: "South Korean Won"),
  Country(abbreviation: "MXN", flag: "assets/mx.svg", name: "Mexican Peso"),
  Country(
    abbreviation: "MYR",
    flag: "assets/my.svg",
    name: "Malaysian Ringgit",
  ),
  Country(abbreviation: "NOK", flag: "assets/no.svg", name: "Norwegian Krone"),
  Country(
    abbreviation: "NZD",
    flag: "assets/nz.svg",
    name: "New Zealand Dollar",
  ),
  Country(abbreviation: "PHP", flag: "assets/ph.svg", name: "Philippine Peso"),
  Country(abbreviation: "PLN", flag: "assets/pl.svg", name: "Polish Zloty"),
  Country(
    abbreviation: "RON",
    flag: "assets/romania.svg",
    name: "Romanian Leu",
  ),
  Country(abbreviation: "RUB", flag: "assets/ru.svg", name: "Russian Ruble"),
  Country(abbreviation: "SEK", flag: "assets/sek.svg", name: "Swedish Krona"),
  Country(abbreviation: "SGD", flag: "assets/sg.svg", name: "Singapore Dollar"),
  Country(abbreviation: "THB", flag: "assets/th.svg", name: "Thai Baht"),
  Country(abbreviation: "TRY", flag: "assets/tr.svg", name: "Turkish Lira"),
  Country(
    abbreviation: "USD",
    flag: "assets/us.svg",
    name: "United States Dollar",
  ),
  Country(
    abbreviation: "ZAR",
    flag: "assets/za.svg",
    name: "South African Rand",
  ),
];

var countriesMap = {
  for (var country in countries) country.abbreviation: country,
};
