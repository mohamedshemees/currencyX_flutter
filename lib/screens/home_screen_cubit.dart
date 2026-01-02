import 'package:bloc/bloc.dart';
import 'package:currencyx/domain/CurrencyRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  final CurrencyRepository _currencyRepository;

  HomeScreenCubit(this._currencyRepository)
    : super(
        HomeScreenState(
          baseCurrency: "USD",
          targetCurrency: "EUR",
          amount: 1.0,
          rates: const {},
          isLoading: false,
          errorMessage: "",
          result: '',
        ),
      ) {
    getCurrencies();
    calculateResult();
  }

  Future<void> getCurrencies() async {
    try {
      emit(state);
      final data = await _currencyRepository.getCurrencyExchangeRate(
        state.baseCurrency,
        "",
      );
      emit(state.copyWith(rates: data.data, isLoading: false));
      calculateResult();
    } catch (e) {
      print('LOG:' + e.toString());
    }
  }

  void onChangeBaseCurrency(String baseCurrency) {
    emit(state.copyWith(baseCurrency: baseCurrency));
    getCurrencies();
  }

  void onChangeTargetCurrency(String targetCurrency) {
    emit(state.copyWith(targetCurrency: targetCurrency));
    calculateResult();
  }

  void onChangeAmount(String amount) {
    double doubleAmount = double.parse(amount);
    emit(state.copyWith(amount: doubleAmount));
    calculateResult();
  }

  void onCLickSwap() {
    final currentState = state;
    emit(
      state.copyWith(
        baseCurrency: currentState.targetCurrency,
        targetCurrency: currentState.baseCurrency,
      ),
    );
    getCurrencies();
  }

  void calculateResult() {
    var result = state.amount * state.rates.values.last[state.targetCurrency]!;
    emit(state.copyWith(result: result.roundToDouble().toString()));
  }
}
extension DateFormatting on String {
  String formatted() {
    final parsedDate = DateTime.parse(this);
    return DateFormat('MMM d, yyyy').format(parsedDate.toLocal());
  }
}