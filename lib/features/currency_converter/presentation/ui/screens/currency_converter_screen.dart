import 'package:currencyapp/core/dependency_injection/injection.dart';
import 'package:currencyapp/core/resources/values_manager.dart';
import 'package:currencyapp/core/utils/enums/enums.dart';
import 'package:currencyapp/features/currency_converter/presentation/logic/currency_converter_cubit.dart';
import 'package:currencyapp/features/currency_converter/presentation/ui/widgets/currency_input_card.dart';
import 'package:currencyapp/features/currency_converter/presentation/ui/widgets/exchange_rate_result.dart';
import 'package:currencyapp/features/home/presentation/logic/currency_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CurrencyConverterScreen extends StatefulWidget {
  final String? currencyId;

  const CurrencyConverterScreen({super.key, this.currencyId});

  @override
  State<CurrencyConverterScreen> createState() =>
      _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  late CurrencyConverterCubit cubit;
  final CurrencyCubit currencyCubit = getIt<CurrencyCubit>();

  @override
  void initState() {
    super.initState();
    cubit = getIt<CurrencyConverterCubit>();
    if (widget.currencyId != null) {
      cubit.getCurrencyConverterData(currencyId: widget.currencyId!);
    }
    currencyCubit.initController();
  }

  @override
  void dispose() {
    cubit.clearCubitState();
    currencyCubit.disposeController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Currency Converter'), elevation: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: BlocBuilder<CurrencyConverterCubit, CurrencyConverterState>(
          buildWhen: (previous, current) =>
              previous.getCurrencyConverterRequestState !=
              current.getCurrencyConverterRequestState,
          builder: (context, state) {
            final isLoading =
                state.getCurrencyConverterRequestState == RequestState.loading;
            return Skeletonizer(
              enabled: isLoading,
              child: Column(
                spacing: AppSpacing.lg,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  CurrencyInputCard(),
                  Icon(Icons.arrow_downward, size: 32, color: Colors.blue),
                  ExchangeRateResult(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
