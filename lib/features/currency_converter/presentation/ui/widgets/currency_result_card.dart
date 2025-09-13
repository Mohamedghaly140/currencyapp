import 'package:currencyapp/core/resources/font_manager.dart';
import 'package:currencyapp/core/resources/styles_manager.dart';
import 'package:currencyapp/core/utils/extensions/numbers.dart';
import 'package:currencyapp/features/currency_converter/presentation/logic/currency_converter_cubit.dart';
import 'package:currencyapp/features/currency_converter/presentation/ui/widgets/countries_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyResultCard extends StatelessWidget {
  const CurrencyResultCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                BlocBuilder<CurrencyConverterCubit, CurrencyConverterState>(
                  buildWhen: (previous, current) =>
                      previous.targetCountry != current.targetCountry,
                  builder: (context, state) {
                    return Text(
                      'To ${state.targetCountry.alpha3}',
                      style: AppTextStyle.getMediumStyle(
                        fontSize: FontSize.s16,
                        color: Colors.black87,
                      ),
                    );
                  },
                ),
                IconButton(
                  onPressed: () {
                    CountriesBottomSheet.show(context);
                  },
                  icon: const Icon(Icons.edit),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocBuilder<CurrencyConverterCubit, CurrencyConverterState>(
                    buildWhen: (previous, current) =>
                        previous.targetCountry != current.targetCountry,
                    builder: (context, state) {
                      return Text(
                        state.targetCountry.currencySymbol ?? '',
                        style: AppTextStyle.getMediumStyle(
                          fontSize: FontSize.s22,
                          color: Colors.black87,
                        ),
                      );
                    },
                  ),
                  BlocBuilder<CurrencyConverterCubit, CurrencyConverterState>(
                    buildWhen: (previous, current) =>
                        previous.convertedAmount != current.convertedAmount,
                    builder: (context, state) {
                      return Text(
                        state.convertedAmount.truncateToDecimals(4).toString(),
                        style: AppTextStyle.getMediumStyle(
                          fontSize: FontSize.s22,
                          color: Colors.blue.shade900,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
