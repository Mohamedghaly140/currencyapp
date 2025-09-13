import 'package:currencyapp/core/dependency_injection/injection.dart';
import 'package:currencyapp/core/resources/font_manager.dart';
import 'package:currencyapp/core/resources/styles_manager.dart';
import 'package:currencyapp/features/currency_converter/presentation/logic/currency_converter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyInputCard extends StatelessWidget {
  const CurrencyInputCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BlocBuilder<CurrencyConverterCubit, CurrencyConverterState>(
              buildWhen: (previous, current) =>
                  previous.sourceCountry != current.sourceCountry,
              builder: (context, state) {
                return Text(
                  'From ${state.sourceCountry?.currencyId ?? ''}',
                  textAlign: TextAlign.start,
                  style: AppTextStyle.getMediumStyle(
                    fontSize: FontSize.s16,
                    color: Colors.black87,
                  ),
                );
              },
            ),
            const SizedBox(height: 8),
            TextField(
              // controller: controller,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
              ],
              decoration: InputDecoration(
                hintText: 'Enter amount',
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                prefixIconConstraints: BoxConstraints(
                  minWidth: 0,
                  minHeight: 0,
                ),
                prefixIcon:
                    BlocBuilder<CurrencyConverterCubit, CurrencyConverterState>(
                      buildWhen: (previous, current) =>
                          previous.sourceCountry != current.sourceCountry,
                      builder: (context, state) {
                        return Text(
                          state.sourceCountry?.currencySymbol ?? '',
                          style: AppTextStyle.getMediumStyle(
                            fontSize: FontSize.s22,
                            color: Colors.black87,
                          ),
                        );
                      },
                    ),
              ),
              onChanged: (value) {
                getIt<CurrencyConverterCubit>().setEnteredAmount(
                  double.tryParse(value) ?? 0.0,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
