import 'package:currencyapp/core/resources/app_border_radius.dart';
import 'package:currencyapp/core/resources/font_manager.dart';
import 'package:currencyapp/core/resources/styles_manager.dart';
import 'package:currencyapp/core/resources/values_manager.dart';
import 'package:currencyapp/core/utils/extensions/strings.dart';
import 'package:flutter/material.dart';

class ExchangeRateInfo extends StatelessWidget {
  final String sourceCurrency;
  final String targetCurrency;
  final double exchangeRate;

  const ExchangeRateInfo({
    super.key,
    required this.sourceCurrency,
    required this.targetCurrency,
    required this.exchangeRate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(AppBorderRadius.md),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.1), width: 1),
      ),
      padding: const EdgeInsets.all(AppPadding.p16),
      child: Text(
        '1 ${sourceCurrency.capitalizeEachWord()} = $exchangeRate ${targetCurrency.capitalizeEachWord()}',
        textAlign: TextAlign.center,
        style: AppTextStyle.getRegularStyle(
          fontSize: FontSize.s13,
          color: Colors.black87,
        ),
      ),
    );
  }
}
