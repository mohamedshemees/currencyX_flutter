import 'package:currencyx/theme/app_colors.dart';
import 'package:currencyx/theme/app_fonts.dart';
import 'package:currencyx/theme/custom_colors_extension.dart';
import 'package:currencyx/widgets/countries_dropdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CurrencyCardWidget extends StatelessWidget {
  final String title;
  final String hint;
  final bool enabledTextField;
  final String result;
  final String currentCurrency;
  final void Function(String) onPressed;
  final void Function(String) onChangeValue;

  const CurrencyCardWidget({
    super.key,
    required this.title,
    required this.hint,
    required this.enabledTextField,
    required this.result,
    required this.onPressed,
    required this.onChangeValue,
    required this.currentCurrency,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(
            context,
          ).extension<CustomColorsExtension>()!.cardBackgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontFamily: AppFonts.roboto,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppColors.subtleTextColor,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: CountriesDropdownWidget(
                      currentCurrency: currentCurrency,
                      onPressed: onPressed,
                    ),
                  ),
                ],
              ),
              enabledTextField
                  ? TextField(
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'^\d*\.?\d*$'),
                        ),
                      ],
                      onChanged: ((value) => {onChangeValue(value)}),
                      enabled: enabledTextField,
                      decoration: InputDecoration(hintText: hint),
                    )
                  : SizedBox(
                  height: MediaQuery.of(context).size.height *.1 ,
                  child: AnimatedText(title:"${currentCurrency.substring(0,2)} $result",))
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedText extends StatefulWidget {
  final String title;
  AnimatedText({required this.title});
  @override
  State<StatefulWidget> createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _alignmentAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _alignmentAnimation = AlignmentTween(
      begin: Alignment.topLeft,
      end: Alignment.bottomLeft,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Align(
          alignment: _alignmentAnimation.value,
          child: Text(
            widget.title,
            style: TextStyle(
              fontFamily: AppFonts.roboto,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.accentColor,
            ),
          ),
        );
      },
    );
  }
}