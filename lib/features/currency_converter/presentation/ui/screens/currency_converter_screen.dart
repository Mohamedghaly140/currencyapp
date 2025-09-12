import 'package:currencyapp/core/resources/values_manager.dart';
import 'package:currencyapp/features/currency_converter/presentation/logic/currency_converter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/currency_input_card.dart';
import '../widgets/currency_result_card.dart';
import '../widgets/exchange_rate_info.dart';

class CurrencyConverterScreen extends StatefulWidget {
  final String? currencyId;

  const CurrencyConverterScreen({super.key, this.currencyId});

  @override
  State<CurrencyConverterScreen> createState() =>
      _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  final TextEditingController _amountController = TextEditingController();
  double _convertedAmount = 0.0;

  // Dummy exchange rate for demonstration
  final double _exchangeRate = 1.08; // Example: EUR to USD

  @override
  void initState() {
    super.initState();
    if (widget.currencyId != null) {
      // getIt<CurrencyConverterCubit>().getCurrencyConverterData(
      //   currencyId: widget.currencyId!,
      // );
    }
    _amountController.addListener(_updateConversion);
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  void _updateConversion() {
    setState(() {
      if (_amountController.text.isEmpty) {
        _convertedAmount = 0.0;
      } else {
        try {
          final amount = double.parse(_amountController.text);
          _convertedAmount = amount * _exchangeRate;
        } catch (e) {
          _convertedAmount = 0.0;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Currency Converter'), elevation: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CurrencyInputCard(),

            const SizedBox(height: 16),

            const Icon(Icons.arrow_downward, size: 32, color: Colors.blue),

            const SizedBox(height: 16),

            BlocBuilder<CurrencyConverterCubit, CurrencyConverterState>(
              buildWhen: (previous, current) =>
                  previous.convertedAmount != current.convertedAmount ||
                  previous.targetCountry != current.targetCountry,
              builder: (context, state) {
                return CurrencyResultCard(
                  targetCurrency: state.targetCountry?.alpha3 ?? '',
                  convertedAmount: state.convertedAmount,
                );
              },
            ),

            const SizedBox(height: 24),

            BlocBuilder<CurrencyConverterCubit, CurrencyConverterState>(
              buildWhen: (previous, current) =>
                  previous.exchangeRate != current.exchangeRate ||
                  previous.sourceCountry != current.sourceCountry ||
                  previous.targetCountry != current.targetCountry,
              builder: (context, state) {
                return ExchangeRateInfo(
                  sourceCurrency: state.sourceCountry?.currencyName ?? '',
                  targetCurrency: state.targetCountry?.currencyName ?? '',
                  exchangeRate: state.exchangeRate,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
