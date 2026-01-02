import 'package:currencyx/screens/home_screen_cubit.dart';
import 'package:currencyx/widgets/currency_card_widget.dart';
import 'package:currencyx/widgets/swap_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConversionViewWidget extends StatelessWidget {
  const ConversionViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeScreenCubit>().state;
    return Column(
      children: [
        CurrencyCardWidget(
          currentCurrency: state.baseCurrency,
          enabledTextField: true,
          title: "From    ",
          hint: "Enter Amount",
          onPressed: (String baseCurrency) {
            context.read<HomeScreenCubit>().onChangeBaseCurrency(baseCurrency);
          },
          result: '',
          onChangeValue: (String p1) {
            context.read<HomeScreenCubit>().onChangeAmount(p1);
          },
        ),
        const SwapButtonWidget(),
        CurrencyCardWidget(
          currentCurrency: state.targetCurrency,
          enabledTextField: false,
          title: "To       ",
          hint: "Result",
          onPressed: (String targetCurrency) {
            context.read<HomeScreenCubit>().onChangeTargetCurrency(targetCurrency);
          },
          onChangeValue: (String amount) {},
          result: state.result,
        ),
      ],
    );
  }
}
