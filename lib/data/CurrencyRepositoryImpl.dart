import 'package:currencyx/domain/ApiService.dart';
import 'package:currencyx/domain/CurrencyRepository.dart';

class CurrencyRepositoryImpl implements CurrencyRepository {
  ApiService apiService;

  CurrencyRepositoryImpl({required this.apiService});

  @override
  Future<Response> getCurrencyExchangeRate(String currencyCode,
      String date) {
    return apiService.getCurrencyExchangeRate(
      baseCurrency: currencyCode,
      date : date,
    );
  }
}