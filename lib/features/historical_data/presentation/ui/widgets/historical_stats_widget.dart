import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:currencyapp/features/historical_data/data/models/historical_data_response_model.dart';

class HistoricalStatsWidget extends StatelessWidget {
  final CurrencyHistoryModel currencyHistory;
  final String currencyPair;
  final Color accentColor;

  const HistoricalStatsWidget({
    super.key,
    required this.currencyHistory,
    required this.currencyPair,
    this.accentColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    final stats = _calculateStats();

    return Container(
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
          _StatsHeader(accentColor: accentColor, currencyPair: currencyPair),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _StatCard(
                  title: 'Current',
                  value: stats.current.toStringAsFixed(6),
                  icon: Icons.timeline,
                  color: accentColor,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _StatCard(
                  title: 'Average',
                  value: stats.average.toStringAsFixed(6),
                  icon: Icons.show_chart,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _StatCard(
                  title: 'Highest',
                  value: stats.highest.toStringAsFixed(6),
                  icon: Icons.trending_up,
                  color: Colors.green,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _StatCard(
                  title: 'Lowest',
                  value: stats.lowest.toStringAsFixed(6),
                  icon: Icons.trending_down,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _VolatilityBanner(
            volatility: stats.volatility,
            color: _getVariabilityColor(stats.volatility),
            icon: _getVariabilityIcon(stats.volatility),
            description: _getVariabilityDescription(stats.volatility),
          ),
        ],
      ),
    );
  }

  HistoricalStats _calculateStats() {
    final values = currencyHistory.values.values.toList();
    final sortedDates = currencyHistory.values.keys.toList()..sort();

    final current = currencyHistory.values[sortedDates.last]!;
    final highest = values.reduce((a, b) => a > b ? a : b);
    final lowest = values.reduce((a, b) => a < b ? a : b);
    final average = values.reduce((a, b) => a + b) / values.length;

    // Calculate standard deviation for volatility
    final variance =
        values
            .map((value) => (value - average) * (value - average))
            .reduce((a, b) => a + b) /
        values.length;
    final volatility = variance > 0 ? (math.sqrt(variance) / average) : 0.0;

    return HistoricalStats(
      current: current,
      highest: highest,
      lowest: lowest,
      average: average,
      volatility: volatility,
    );
  }

  Color _getVariabilityColor(double volatility) {
    if (volatility < 0.02) return Colors.green;
    if (volatility < 0.05) return Colors.orange;
    return Colors.red;
  }

  IconData _getVariabilityIcon(double volatility) {
    if (volatility < 0.02) return Icons.trending_flat;
    if (volatility < 0.05) return Icons.trending_up;
    return Icons.warning;
  }

  String _getVariabilityDescription(double volatility) {
    if (volatility < 0.02) return 'Low volatility - Stable rate';
    if (volatility < 0.05) return 'Moderate volatility - Some fluctuation';
    return 'High volatility - Significant fluctuation';
  }
}

class _StatsHeader extends StatelessWidget {
  final Color accentColor;
  final String currencyPair;

  const _StatsHeader({required this.accentColor, required this.currencyPair});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.analytics_outlined, color: accentColor, size: 20),
        const SizedBox(width: 8),
        Text(
          'Statistics - $currencyPair',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}

class _VolatilityBanner extends StatelessWidget {
  final double volatility;
  final Color color;
  final IconData icon;
  final String description;

  const _VolatilityBanner({
    required this.volatility,
    required this.color,
    required this.icon,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.3), width: 1),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 18),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Volatility: ${(volatility * 100).toStringAsFixed(2)}%',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: color,
                  fontSize: 14,
                ),
              ),
              Text(
                description,
                style: TextStyle(
                  color: color.withValues(alpha: 0.8),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.3), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 16),
              const SizedBox(width: 4),
              Text(
                title,
                style: TextStyle(
                  color: color,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class HistoricalStats {
  final double current;
  final double highest;
  final double lowest;
  final double average;
  final double volatility;

  HistoricalStats({
    required this.current,
    required this.highest,
    required this.lowest,
    required this.average,
    required this.volatility,
  });
}
