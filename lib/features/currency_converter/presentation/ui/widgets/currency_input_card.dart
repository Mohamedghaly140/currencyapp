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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<CurrencyConverterCubit, CurrencyConverterState>(
              buildWhen: (previous, current) =>
                  previous.sourceCountry != current.sourceCountry,
              builder: (context, state) {
                return Text(
                  'From ${state.sourceCountry?.alpha3 ?? ''}',
                  style: Theme.of(context).textTheme.titleMedium,
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
                prefixIcon: const Icon(Icons.euro),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
