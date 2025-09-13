import 'package:currencyapp/features/historical_data/presentation/ui/widgets/empty_historical_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:currencyapp/core/dependency_injection/injection.dart';
import 'package:currencyapp/core/helpers/debug_helper.dart';
import 'package:currencyapp/core/utils/enums/enums.dart';
import 'package:currencyapp/features/historical_data/presentation/logic/historical_data_cubit.dart';
import 'package:currencyapp/features/historical_data/presentation/ui/widgets/historical_chart_widget.dart';
import 'package:currencyapp/features/historical_data/presentation/ui/widgets/historical_data_list_widget.dart';
import 'package:currencyapp/features/historical_data/presentation/ui/widgets/historical_stats_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HistoricalDataScreen extends StatefulWidget {
  final String? currencyId;

  const HistoricalDataScreen({super.key, this.currencyId});

  @override
  State<HistoricalDataScreen> createState() => _HistoricalDataScreenState();
}

class _HistoricalDataScreenState extends State<HistoricalDataScreen>
    with TickerProviderStateMixin {
  late final HistoricalDataCubit _cubit;
  late final TabController _tabController;
  DateTime _startDate = DateTime.now().subtract(const Duration(days: 6));
  DateTime _endDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _cubit = getIt<HistoricalDataCubit>();
    _tabController = TabController(length: 2, vsync: this);
    DebugHelper.log('currencyId: ${widget.currencyId}');

    if (widget.currencyId != null) {
      _loadHistoricalData();
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _loadHistoricalData() {
    _cubit.getHistoricalData(
      currencyId: widget.currencyId!,
      startDate: _startDate,
      endDate: _endDate,
    );
  }

  Future<void> _selectDateRange() async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now().subtract(const Duration(days: 90)),
      lastDate: DateTime.now(),
      initialDateRange: DateTimeRange(start: _startDate, end: _endDate),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(
              context,
            ).colorScheme.copyWith(primary: Colors.blue),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      // Validate that the selected range is exactly 7 days
      // Add 1 to include both start and end dates in the count
      final daysDifference = picked.end.difference(picked.start).inDays + 1;

      if (daysDifference != 7) {
        // Show error message if range is not exactly 7 days
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Date range must be exactly 7 days. You selected $daysDifference days.',
              ),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 3),
              action: SnackBarAction(
                label: 'OK',
                textColor: Colors.white,
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
              ),
            ),
          );
        }
        return; // Don't update the dates if validation fails
      }

      setState(() {
        _startDate = picked.start;
        _endDate = picked.end;
      });
      _loadHistoricalData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          title: Text(
            'Historical Data',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.date_range),
              onPressed: _selectDateRange,
              tooltip: 'Select Date Range',
            ),
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: widget.currencyId != null ? _loadHistoricalData : null,
              tooltip: 'Refresh Data',
            ),
          ],
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: const [
              Tab(icon: Icon(Icons.show_chart), text: 'Charts'),
              Tab(icon: Icon(Icons.list), text: 'Details'),
            ],
          ),
        ),
        body: widget.currencyId == null
            ? _buildNoCurrencySelected()
            : BlocBuilder<HistoricalDataCubit, HistoricalDataState>(
                builder: (context, state) {
                  return _buildContent(state);
                },
              ),
      ),
    );
  }

  Widget _buildNoCurrencySelected() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.currency_exchange, size: 80, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'No Currency Selected',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Please select a currency to view historical data',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(HistoricalDataState state) {
    final isLoading =
        state.getHistoricalDataRequestState == RequestState.loading;

    if (state.getHistoricalDataRequestState == RequestState.error) {
      return _buildErrorState(state.errorMessage);
    }

    if (state.getHistoricalDataRequestState == RequestState.loaded &&
        (state.historicalData == null || state.historicalData!.rates.isEmpty)) {
      return _buildNoDataState();
    }

    return Skeletonizer(
      enabled: isLoading,
      child: TabBarView(
        controller: _tabController,
        children: [_buildChartsTab(state), _buildDetailsTab(state)],
      ),
    );
  }

  Widget _buildErrorState(String? errorMessage) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 80, color: Colors.red),
          const SizedBox(height: 16),
          const Text(
            'Error Loading Data',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            errorMessage ?? 'An unexpected error occurred',
            style: const TextStyle(fontSize: 14, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: _loadHistoricalData,
            icon: const Icon(Icons.refresh),
            label: const Text('Retry'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoDataState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.data_usage_outlined, size: 80, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'No Data Available',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'No historical data found for the selected period',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildChartsTab(HistoricalDataState state) {
    final data = state.historicalData ?? EmptyHistoricalData.data;
    final currencyPairs = data.rates.keys.toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Statistics widget
          if (currencyPairs.isNotEmpty)
            HistoricalStatsWidget(
              currencyHistory: data.rates[currencyPairs.first]!,
              currencyPair: currencyPairs.first,
              accentColor: Colors.blue,
            ),
          const SizedBox(height: 16),

          // Charts for each currency pair
          ...currencyPairs.asMap().entries.map((entry) {
            final index = entry.key;
            final pair = entry.value;
            final colors = [
              Colors.blue,
              Colors.green,
              Colors.orange,
              Colors.purple,
            ];

            return Column(
              children: [
                HistoricalChartWidget(
                  currencyHistory: data.rates[pair]!,
                  currencyPair: pair,
                  lineColor: colors[index % colors.length],
                ),
                const SizedBox(height: 16),
              ],
            );
          }),
        ],
      ),
    );
  }

  Widget _buildDetailsTab(HistoricalDataState state) {
    final data = state.historicalData ?? EmptyHistoricalData.data;
    final currencyPairs = data.rates.keys.toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: currencyPairs.asMap().entries.map((entry) {
          final index = entry.key;
          final pair = entry.value;
          final colors = [
            Colors.blue,
            Colors.green,
            Colors.orange,
            Colors.purple,
          ];

          return Column(
            children: [
              HistoricalDataListWidget(
                currencyHistory: data.rates[pair]!,
                currencyPair: pair,
                accentColor: colors[index % colors.length],
              ),
              const SizedBox(height: 16),
            ],
          );
        }).toList(),
      ),
    );
  }
}
