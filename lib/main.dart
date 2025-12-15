import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
          Text("Currency"),
          Text("Exchange"),
          BaseCurrencyWidget()
        ],
        ),
      )
    );
  }
}
class BaseCurrencyWidget extends StatelessWidget {
  const BaseCurrencyWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
            children: [
              Text("From"),
              CountriesDropdownWidget()
            ],
            ),
            Text("Amro Currency"),
          ],
        ) ,
      ),
    );
  }
}
class CountriesDropdownWidget extends StatelessWidget {
  const CountriesDropdownWidget({super.key});
  @override
  Widget build(BuildContext context) {
  return DropdownButton<Country>(
    items: countries.map((Country country) {
      return DropdownMenuItem<Country>(
        value: country,
        child: Row(
          
          children: <Widget>[
            Text(country.flag),
             Column(
          children: [
            Text(country.abbreviation),
            Text(country.name),
          ],
        )])
      );
    }).toList(),
    onChanged: (value) {
      print(value);
    },

  );

  }
}

class Country{
  String abbreviation;
  String flag;
  String name;
  Country({required this.abbreviation, required this.flag, required this.name});
}
var countries = [
  Country(abbreviation: "USD", flag: "🇺🇸", name: "United States"),
  Country(abbreviation: "CAD", flag: "🇨🇦", name: "Canada"),
  Country(abbreviation: "INR", flag: "🇮🇳", name: "India"),
  Country(abbreviation: "EUR", flag: "🇪🇺", name: "Europe"),
];
