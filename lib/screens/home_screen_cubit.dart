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
          date: '',
          ratio: '',
        ),
      ) {
    getCurrencies();
  }

  Future<void> getCurrencies() async {
    try {
      emit(state.copyWith(isLoading: true));
      final data = await _currencyRepository.getCurrencyExchangeRate(
        state.baseCurrency,
        state.date,
      );
      emit(state.copyWith(rates: data.data, isLoading: false));
      calculateResult();
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
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
    double? doubleAmount = double.tryParse(amount);
    if (doubleAmount != null) {
      emit(state.copyWith(amount: doubleAmount));
      calculateResult();
    }
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
    if (state.rates.isNotEmpty &&
        state.rates.values.first.containsKey(state.targetCurrency)) {
      final rate = state.rates.values.first[state.targetCurrency];
      if (rate != null) {
        final result = state.amount * rate;
        final ratio =
            "1 ${state.baseCurrency} = ${rate.toStringAsFixed(4)} ${state.targetCurrency}";
        emit(state.copyWith(result: result.toStringAsFixed(4), ratio: ratio));
      }
    }
  }

  void onSelectDate(DateTime? selectedDate) {
    if (selectedDate != null) {
      emit(state.copyWith(date: selectedDate.toString().formatted()));
      getCurrencies();
    }
  }
}

extension DateFormatting on String {
  String formatted() {
    final parsedDate = DateTime.parse(this);
    return DateFormat('yyyy-MM-dd').format(parsedDate.toLocal());
  }
}
