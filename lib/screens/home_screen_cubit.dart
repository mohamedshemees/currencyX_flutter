import 'package:bloc/bloc.dart';
import 'package:currencyx/domain/CurrencyRepository.dart';
import 'package:meta/meta.dart';

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
    //getCurrencies("USD");
  }

  Future<void> getCurrencies() async {
    try {
      emit(state);
      final data = await _currencyRepository.getCurrencyExchangeRate(
        state.baseCurrency,
        "",
      );

      emit(state.copyWith(rates: data.data, isLoading: false));
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
  }

  void onChangeAmount(double amount) {
    emit(state.copyWith(amount: amount));
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
}
