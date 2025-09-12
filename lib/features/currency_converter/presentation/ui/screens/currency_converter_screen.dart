import 'package:currencyapp/core/dependency_injection/injection.dart';
import 'package:currencyapp/features/currency_converter/presentation/logic/currency_converter_cubit.dart';
import 'package:flutter/material.dart';

class CurrencyConverterScreen extends StatefulWidget {
  final String? currencyId;

  const CurrencyConverterScreen({super.key, this.currencyId});

  @override
  State<CurrencyConverterScreen> createState() =>
      _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.currencyId != null) {
      getIt<CurrencyConverterCubit>().getCurrencyConverterData(
        currencyId: widget.currencyId!,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Currency Converter')));
  }
}
