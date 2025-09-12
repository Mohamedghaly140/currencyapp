import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:currencyapp/features/historical_data/data/models/historical_data_response_model.dart';
import 'package:currencyapp/core/resources/styles_manager.dart';
import 'package:currencyapp/core/resources/font_manager.dart';
import 'package:intl/intl.dart';

class HistoricalChartWidget extends StatelessWidget {
  final CurrencyHistoryModel currencyHistory;
  final String currencyPair;
  final Color lineColor;

  const HistoricalChartWidget({
    super.key,
    required this.currencyHistory,
    required this.currencyPair,
    this.lineColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    final spots = _generateSpots();
    final minY = _getMinValue();
    final maxY = _getMaxValue();

    return Container(
      height: 300,
      padding: const EdgeInsets.all(16),
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
          _ChartHeader(
            currencyPair: currencyPair,
            daysCount: spots.length,
            lineColor: lineColor,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: _HistoricalLineChart(
              spots: spots,
              minY: minY,
              maxY: maxY,
              lineColor: lineColor,
              currencyHistory: currencyHistory,
            ),
          ),
        ],
      ),
    );
  }

  List<FlSpot> _generateSpots() {
    final sortedEntries = currencyHistory.values.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));

    return sortedEntries
        .asMap()
        .entries
        .map((entry) => FlSpot(entry.key.toDouble(), entry.value.value))
        .toList();
  }

  double _getMinValue() {
    return currencyHistory.values.values.reduce((a, b) => a < b ? a : b);
  }

  double _getMaxValue() {
    return currencyHistory.values.values.reduce((a, b) => a > b ? a : b);
  }
}

class _ChartHeader extends StatelessWidget {
  final String currencyPair;
  final int daysCount;
  final Color lineColor;

  const _ChartHeader({
    required this.currencyPair,
    required this.daysCount,
    required this.lineColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          currencyPair,
          style: AppTextStyle.getBoldStyle(
            fontSize: FontSize.s18,
            color: Colors.black87,
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: lineColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            '$daysCount days',
            style: AppTextStyle.getMediumStyle(
              fontSize: FontSize.s12,
              color: lineColor,
            ),
          ),
        ),
      ],
    );
  }
}

class _HistoricalLineChart extends StatelessWidget {
  final List<FlSpot> spots;
  final double minY;
  final double maxY;
  final Color lineColor;
  final CurrencyHistoryModel currencyHistory;

  const _HistoricalLineChart({
    required this.spots,
    required this.minY,
    required this.maxY,
    required this.lineColor,
    required this.currencyHistory,
  });

  @override
  Widget build(BuildContext context) {
    final double rawRange = maxY - minY;
    final double safeRange = rawRange == 0
        ? (maxY != 0 ? maxY.abs() * 0.01 : 1.0)
        : rawRange;
    final double chartMinY = minY - safeRange * 0.1;
    final double chartMaxY = maxY + safeRange * 0.1;
    final double yInterval = safeRange / 4;

    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: yInterval,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: Colors.grey.withValues(alpha: 0.2),
              strokeWidth: 1,
            );
          },
        ),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: spots.length > 7 ? spots.length / 4 : 1,
              getTitlesWidget: (double value, TitleMeta meta) {
                if (value.toInt() >= 0 && value.toInt() < spots.length) {
                  final dateList = currencyHistory.values.keys.toList()..sort();
                  final date = dateList[value.toInt()];
                  return Text(
                    DateFormat('MM/dd').format(date),
                    style: AppTextStyle.getRegularStyle(
                      fontSize: FontSize.s10,
                      color: Colors.grey,
                    ),
                  );
                }
                return const Text('');
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: yInterval,
              reservedSize: 60,
              getTitlesWidget: (double value, TitleMeta meta) {
                return Text(
                  value.toStringAsFixed(4),
                  style: AppTextStyle.getRegularStyle(
                    fontSize: FontSize.s10,
                    color: Colors.grey,
                  ),
                );
              },
            ),
          ),
        ),
        borderData: FlBorderData(
          show: true,
          border: Border(
            bottom: BorderSide(color: Colors.grey.withValues(alpha: 0.2)),
            left: BorderSide(color: Colors.grey.withValues(alpha: 0.2)),
          ),
        ),
        minX: 0,
        maxX: spots.isEmpty ? 0 : spots.length.toDouble() - 1,
        minY: chartMinY,
        maxY: chartMaxY,
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            gradient: LinearGradient(
              colors: [lineColor.withValues(alpha: 0.8), lineColor],
            ),
            barWidth: 3,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: spots.length <= 10,
              getDotPainter: (spot, percent, barData, index) =>
                  FlDotCirclePainter(
                    radius: 4,
                    color: lineColor,
                    strokeWidth: 2,
                    strokeColor: Colors.white,
                  ),
            ),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: [
                  lineColor.withValues(alpha: 0.2),
                  lineColor.withValues(alpha: 0.05),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ],
        lineTouchData: LineTouchData(
          enabled: true,
          touchTooltipData: LineTouchTooltipData(
            getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
              return touchedBarSpots.map((barSpot) {
                final dateList = currencyHistory.values.keys.toList()..sort();
                final date = dateList[barSpot.x.toInt()];
                return LineTooltipItem(
                  '${DateFormat('MMM dd, yyyy').format(date)}\n${barSpot.y.toStringAsFixed(6)}',
                  AppTextStyle.getBoldStyle(color: Colors.white),
                );
              }).toList();
            },
          ),
        ),
      ),
    );
  }
}
