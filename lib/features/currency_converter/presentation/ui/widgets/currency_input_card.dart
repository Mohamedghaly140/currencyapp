import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CurrencyInputCard extends StatelessWidget {
  final TextEditingController controller;
  final String sourceCurrency;

  const CurrencyInputCard({
    super.key,
    required this.controller,
    required this.sourceCurrency,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'From $sourceCurrency',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: controller,
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
