class Country {
  String abbreviation;
  String flag;
  String name;

  Country({required this.abbreviation, required this.flag, required this.name});
}

var countries = [
  Country(
    abbreviation: "AUD",
    flag: "assets/au.png",
    name: "Australian Dollar",
  ),
  Country(abbreviation: "BGN", flag: "assets/gb.png", name: "Bulgarian Lev"),
  Country(abbreviation: "BRL", flag: "assets/br.png", name: "Brazilian Real"),
  Country(abbreviation: "CAD", flag: "assets/ca.png", name: "Canadian Dollar"),
  Country(abbreviation: "CHF", flag: "assets/sek.png", name: "Swiss Franc"),
  Country(abbreviation: "CNY", flag: "assets/cn.png", name: "Chinese Yuan"),
  Country(
    abbreviation: "CZK",
    flag: "assets/cz.png",
    name: "Czech Republic Koruna",
  ),
  Country(
    abbreviation: "DKK",
    flag: "assets/de.png",
    name: "Danish Krone",
  ),
  Country(abbreviation: "EUR", flag: "assets/eu.png", name: "Euro"),
  Country(abbreviation: "GBP", flag: "assets/gb.png", name: "British Pound"),
  Country(abbreviation: "HKD", flag: "assets/hk.png", name: "Hong Kong Dollar"),
  Country(abbreviation: "HRK", flag: "assets/cr.png", name: "Croatian Kuna"),
  Country(abbreviation: "HUF", flag: "assets/hu.png", name: "Hungarian Forint"),
  Country(
    abbreviation: "IDR",
    flag: "assets/id.png",
    name: "Indonesian Rupiah",
  ),
  Country(abbreviation: "INR", flag: "assets/in.png", name: "Indian Rupee"),
  Country(abbreviation: "ISK", flag: "assets/is.png", name: "Icelandic Króna"),
  Country(abbreviation: "JPY", flag: "assets/jp.png", name: "Japanese Yen"),
  Country(abbreviation: "KRW", flag: "assets/kr.png", name: "South Korean Won"),
  Country(abbreviation: "MXN", flag: "assets/mx.png", name: "Mexican Peso"),
  Country(
    abbreviation: "MYR",
    flag: "assets/my.png",
    name: "Malaysian Ringgit",
  ),
  Country(abbreviation: "NOK", flag: "assets/no.png", name: "Norwegian Krone"),
  Country(
    abbreviation: "NZD",
    flag: "assets/nz.png",
    name: "New Zealand Dollar",
  ),
  Country(abbreviation: "PHP", flag: "assets/ph.png", name: "Philippine Peso"),
  Country(abbreviation: "PLN", flag: "assets/pl.png", name: "Polish Zloty"),
  Country(
    abbreviation: "RON",
    flag: "assets/ro.png",
    name: "Romanian Leu",
  ),
  Country(abbreviation: "RUB", flag: "assets/ru.png", name: "Russian Ruble"),
  Country(abbreviation: "SEK", flag: "assets/se.png", name: "Swedish Krona"),
  Country(abbreviation: "SGD", flag: "assets/sg.png", name: "Singapore Dollar"),
  Country(abbreviation: "THB", flag: "assets/th.png", name: "Thai Baht"),
  Country(abbreviation: "TRY", flag: "assets/tr.png", name: "Turkish Lira"),
  Country(
    abbreviation: "USD",
    flag: "assets/us.png",
    name: "United States Dollar",
  ),
  Country(
    abbreviation: "ZAR",
    flag: "assets/za.png",
    name: "South African Rand",
  ),
];

var countriesMap = {
  for (var country in countries) country.abbreviation: country,
};
