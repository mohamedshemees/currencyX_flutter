import 'package:currencyx/screens/home_screen_cubit.dart';
import 'package:currencyx/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SwapButtonWidget extends StatelessWidget {
  const SwapButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.accentColor,
            blurRadius: 4,
            offset: Offset(0, 0),
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(50)),
        color: AppColors.accentColor,
      ),
      child: GestureDetector(
        onTap: () {
          context.read<HomeScreenCubit>().onCLickSwap();
        },
        child: SvgPicture.asset(
          "assets/ic_swap.svg",
          colorFilter: const ColorFilter.mode(
            AppColors.cardBackgroundColor,
            BlendMode.srcIn,
          ),
          width: 40,
          height: 40,
        ),
      ),
    );
  }
}
