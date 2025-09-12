import 'package:currencyapp/core/dependency_injection/injection.dart';
import 'package:currencyapp/core/resources/values_manager.dart';
import 'package:currencyapp/features/currency_converter/presentation/logic/currency_converter_cubit.dart';
import 'package:currencyapp/features/currency_converter/presentation/ui/widgets/currency_input_card.dart';
import 'package:currencyapp/features/currency_converter/presentation/ui/widgets/exchange_rate_result.dart';
import 'package:flutter/material.dart';

class CurrencyConverterScreen extends StatefulWidget {
  final String? currencyId;

  const CurrencyConverterScreen({super.key, this.currencyId});

  @override
  State<CurrencyConverterScreen> createState() =>
      _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  late CurrencyConverterCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = getIt<CurrencyConverterCubit>();
    if (widget.currencyId != null) {
      cubit.getCurrencyConverterData(currencyId: widget.currencyId!);
    }
  }

  @override
  void dispose() {
    cubit.clearCubitState();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Currency Converter'), elevation: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Column(
          spacing: AppSpacing.lg,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            CurrencyInputCard(),
            Icon(Icons.arrow_downward, size: 32, color: Colors.blue),
            ExchangeRateResult(),
          ],
        ),
      ),
    );
  }
}
