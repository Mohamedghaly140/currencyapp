import 'package:currencyapp/core/resources/values_manager.dart';
import 'package:currencyapp/core/resources/styles_manager.dart';
import 'package:currencyapp/core/resources/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:currencyapp/features/historical_data/data/models/historical_data_response_model.dart';
import 'package:intl/intl.dart';

class HistoricalDataListWidget extends StatelessWidget {
  final CurrencyHistoryModel currencyHistory;
  final String currencyPair;
  final Color accentColor;

  const HistoricalDataListWidget({
    super.key,
    required this.currencyHistory,
    required this.currencyPair,
    this.accentColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    final sortedEntries = currencyHistory.values.entries.toList()
      ..sort((a, b) => b.key.compareTo(a.key)); // Most recent first

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ListHeader(
            accentColor: accentColor,
            currencyPair: currencyPair,
            count: sortedEntries.length,
          ),
          const Divider(height: 1),
          const _ListTableHeader(),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: sortedEntries.length,
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final entry = sortedEntries[index];
              final date = entry.key;
              final rate = entry.value;

              // Calculate percentage change from previous day
              double? changePercentage;
              Color changeColor = Colors.grey;
              IconData changeIcon = Icons.remove;

              if (index < sortedEntries.length - 1) {
                final previousRate = sortedEntries[index + 1].value;
                final change = ((rate - previousRate) / previousRate) * 100;
                changePercentage = change;

                if (change > 0) {
                  changeColor = Colors.green;
                  changeIcon = Icons.trending_up;
                } else if (change < 0) {
                  changeColor = Colors.red;
                  changeIcon = Icons.trending_down;
                }
              }

              return _HistoricalListItem(
                date: date,
                rate: rate,
                changePercentage: changePercentage,
                changeColor: changeColor,
                changeIcon: changeIcon,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ListHeader extends StatelessWidget {
  final Color accentColor;
  final String currencyPair;
  final int count;

  const _ListHeader({
    required this.accentColor,
    required this.currencyPair,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Icon(Icons.timeline, color: accentColor, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Historical Data - $currencyPair',
              style: AppTextStyle.getBoldStyle(
                fontSize: FontSize.s16,
                color: Colors.black87,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: accentColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '$count entries',
              style: AppTextStyle.getMediumStyle(
                fontSize: FontSize.s12,
                color: accentColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ListTableHeader extends StatelessWidget {
  const _ListTableHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: Colors.grey.withValues(alpha: 0.05),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              'Date',
              style: AppTextStyle.getSemiBoldStyle(
                fontSize: FontSize.s12,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Rate',
              style: AppTextStyle.getSemiBoldStyle(
                fontSize: FontSize.s12,
                color: Colors.grey,
              ),
              textAlign: TextAlign.right,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              'Change',
              style: AppTextStyle.getSemiBoldStyle(
                fontSize: FontSize.s12,
                color: Colors.grey,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}

class _HistoricalListItem extends StatelessWidget {
  final DateTime date;
  final double rate;
  final double? changePercentage;
  final Color changeColor;
  final IconData changeIcon;

  const _HistoricalListItem({
    required this.date,
    required this.rate,
    required this.changePercentage,
    required this.changeColor,
    required this.changeIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        spacing: AppSpacing.md,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat('MMM dd, yyyy').format(date),
                  style: AppTextStyle.getMediumStyle(fontSize: FontSize.s14),
                ),
                Text(
                  DateFormat('EEEE').format(date),
                  style: AppTextStyle.getRegularStyle(
                    fontSize: FontSize.s12,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          Text(
            rate.toStringAsFixed(6),
            style: AppTextStyle.getSemiBoldStyle(
              fontSize: FontSize.s16,
              color: Colors.black87,
            ),
            textAlign: TextAlign.right,
          ),
          changePercentage != null
              ? Row(
                  spacing: 2,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(changeIcon, color: changeColor, size: 16),
                    Text(
                      '${changePercentage!.toStringAsFixed(2)}%',
                      style: AppTextStyle.getMediumStyle(
                        fontSize: FontSize.s12,
                        color: changeColor,
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
