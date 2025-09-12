import 'package:flutter/material.dart';

class CurrencyResultCard extends StatelessWidget {
  final String targetCurrency;
  final double convertedAmount;

  const CurrencyResultCard({
    super.key,
    required this.targetCurrency,
    required this.convertedAmount,
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
              'To $targetCurrency',
              style: Theme.of(context).textTheme.titleMedium,
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
                  const Icon(Icons.attach_money),
                  Text(
                    convertedAmount.toStringAsFixed(2),
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.blue[900],
                      fontWeight: FontWeight.bold,
                    ),
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
