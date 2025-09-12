import 'package:currencyapp/core/dependency_injection/injection.dart';
import 'package:currencyapp/features/home/presentation/logic/currency_cubit.dart';
import 'package:currencyapp/features/home/presentation/ui/widgets/currencies/currencies.dart';
import 'package:currencyapp/features/home/presentation/ui/widgets/search_text_field.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late CurrencyCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = getIt<CurrencyCubit>();
    cubit.getCountries();
    cubit.initController();
  }

  @override
  void dispose() {
    cubit.disposeController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Currency App')),
      body: Column(children: [SearchTextField(), Currencies()]),
    );
  }
}
