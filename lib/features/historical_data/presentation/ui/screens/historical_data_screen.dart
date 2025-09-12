import 'package:currencyapp/core/dependency_injection/injection.dart';
import 'package:currencyapp/features/home/presentation/logic/currency_cubit.dart';
import 'package:currencyapp/features/home/presentation/ui/widgets/currencies/currencies.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    getIt<CurrencyCubit>().getCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Currency App')),
      body: Column(children: [Currencies()]),
    );
  }
}
// List of supported currencies with their country’s flag. Store the data locally in a database
// after the first API request & load the data from it for future usage.