import 'package:currencyapp/features/home/presentation/logic/currency_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Currency App')),
      body: Column(
        children: [
          Center(child: Text('Currency App')),
          ElevatedButton(
            onPressed: () {
              context.read<CurrencyCubit>().getCurrencies();
            },
            child: Text('Get Currencies'),
          ),
        ],
      ),
    );
  }
}
