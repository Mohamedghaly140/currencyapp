import 'package:currencyapp/core/resources/values_manager.dart';
import 'package:currencyapp/features/currency_converter/presentation/logic/currency_converter_cubit.dart';
import 'package:currencyapp/features/currency_converter/presentation/ui/widgets/currency_result_card.dart';
import 'package:currencyapp/features/currency_converter/presentation/ui/widgets/exchange_rate_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExchangeRateResult extends StatelessWidget {
  const ExchangeRateResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppSpacing.xl,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BlocBuilder<CurrencyConverterCubit, CurrencyConverterState>(
          buildWhen: (previous, current) =>
              previous.convertedAmount != current.convertedAmount ||
              previous.targetCountry != current.targetCountry,
          builder: (context, state) {
            return CurrencyResultCard(
              targetCurrency: state.targetCountry.alpha3 ?? '',
              convertedAmount: state.convertedAmount,
            );
          },
        ),

        BlocBuilder<CurrencyConverterCubit, CurrencyConverterState>(
          buildWhen: (previous, current) =>
              previous.exchangeRate != current.exchangeRate ||
              previous.sourceCountry != current.sourceCountry ||
              previous.targetCountry != current.targetCountry,
          builder: (context, state) {
            return ExchangeRateInfo(
              sourceCurrency: state.sourceCountry?.currencyName ?? '',
              targetCurrency: state.targetCountry.currencyName ?? '',
              exchangeRate: state.exchangeRate,
            );
          },
        ),
      ],
    );
  }
}
