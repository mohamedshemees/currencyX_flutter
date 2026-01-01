
import 'package:currencyx/domain/ApiService.dart';

abstract class CurrencyRepository {
  Future<Response> getCurrencyExchangeRate(String currencyCode);
}