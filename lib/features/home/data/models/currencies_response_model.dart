import 'package:currencyapp/core/helpers/debug_helper.dart';
import 'package:currencyapp/features/home/data/models/currency_model.dart';

class CurrencyResponseModel {
  final List<CurrencyModel> currencies;

  CurrencyResponseModel({required this.currencies});

  factory CurrencyResponseModel.fromJson(Map<String, dynamic> json) {
    final results = json['results'] as Map<String, dynamic>;
    DebugHelper.log('results: $results');
    final currencies = results.values
        .map((e) => CurrencyModel.fromJson(e as Map<String, dynamic>))
        .toList();

    return CurrencyResponseModel(currencies: currencies);
  }

  Map<String, dynamic> toJson() => {
    'results': currencies.map((e) => e.toJson()).toList(),
  };
}
