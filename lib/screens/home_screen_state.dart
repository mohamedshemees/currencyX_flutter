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

  const HomeScreenState({
    required this.baseCurrency,
    required this.targetCurrency,
    required this.amount,
    required this.result,
    required this.rates,
    required this.isLoading,
    required this.errorMessage,
  });

  HomeScreenState copyWith({
    String? baseCurrency,
    String? targetCurrency,
    double? amount,
    String? result,
    Map<String, Map<String, double>>? rates,
    bool? isLoading,
    String? errorMessage,
  }) {
    return HomeScreenState(
      baseCurrency: baseCurrency ?? this.baseCurrency,
      targetCurrency: targetCurrency ?? this.targetCurrency,
      amount: amount ?? this.amount,
      result: result ?? this.result,
      rates: rates ?? this.rates,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
