part of 'home_screen_cubit.dart';

@immutable
class HomeScreenState {
  final String baseCurrency;
  final String targetCurrency;
  final double amount;
  final String result;
  final Map<String, Map<String, double>> rates;
  final bool isLoading;
  final String errorMessage;
  final String date;
  final String ratio;

  const HomeScreenState({
    required this.baseCurrency,
    required this.targetCurrency,
    required this.amount,
    required this.result,
    required this.rates,
    required this.isLoading,
    required this.errorMessage,
    required this.date,
    required this.ratio,
  });

  HomeScreenState copyWith({
    String? baseCurrency,
    String? targetCurrency,
    double? amount,
    String? result,
    Map<String, Map<String, double>>? rates,
    bool? isLoading,
    String? errorMessage,
    String? date,
    String? ratio,
  }) {
    return HomeScreenState(
      baseCurrency: baseCurrency ?? this.baseCurrency,
      targetCurrency: targetCurrency ?? this.targetCurrency,
      amount: amount ?? this.amount,
      result: result ?? this.result,
      rates: rates ?? this.rates,
      date: date ?? this.date,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      ratio: ratio ?? this.ratio,
    );
  }
}
