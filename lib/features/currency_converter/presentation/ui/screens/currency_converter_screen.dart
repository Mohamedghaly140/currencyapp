import 'package:flutter/material.dart';
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
  final String _sourceCurrency = 'EUR';
  final String _targetCurrency = 'USD';

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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CurrencyInputCard(
              controller: _amountController,
              sourceCurrency: _sourceCurrency,
            ),

            const SizedBox(height: 16),

            const Icon(Icons.arrow_downward, size: 32, color: Colors.blue),

            const SizedBox(height: 16),

            CurrencyResultCard(
              targetCurrency: _targetCurrency,
              convertedAmount: _convertedAmount,
            ),

            const SizedBox(height: 24),

            ExchangeRateInfo(
              sourceCurrency: _sourceCurrency,
              targetCurrency: _targetCurrency,
              exchangeRate: _exchangeRate,
            ),
          ],
        ),
      ),
    );
  }
}
