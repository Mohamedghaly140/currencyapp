import 'package:flutter/material.dart';

class HistoricalDataScreen extends StatefulWidget {
  const HistoricalDataScreen({super.key});

  @override
  State<HistoricalDataScreen> createState() => _HistoricalDataScreenState();
}

class _HistoricalDataScreenState extends State<HistoricalDataScreen> {
  @override
  void initState() {
    super.initState();
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
