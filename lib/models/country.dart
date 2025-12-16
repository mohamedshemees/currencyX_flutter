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
