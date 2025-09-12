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
    return Center(
      child: Text(
        '1 $sourceCurrency = $exchangeRate $targetCurrency',
        style: Theme.of(
          context,
        ).textTheme.bodyLarge?.copyWith(color: Colors.grey[600]),
      ),
    );
  }
}
