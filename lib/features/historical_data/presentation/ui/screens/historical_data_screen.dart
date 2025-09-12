import 'package:flutter/material.dart';

import 'package:currencyapp/core/helpers/debug_helper.dart';

class HistoricalDataScreen extends StatefulWidget {
  final String? currencyId;

  const HistoricalDataScreen({super.key, this.currencyId});

  @override
  State<HistoricalDataScreen> createState() => _HistoricalDataScreenState();
}

class _HistoricalDataScreenState extends State<HistoricalDataScreen> {
  @override
  void initState() {
    super.initState();
    DebugHelper.log('currencyId: ${widget.currencyId}');
    // TODO: Add get historical data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Historical Data')),
      body: Column(children: [Text('Historical Data')]),
    );
  }
}
