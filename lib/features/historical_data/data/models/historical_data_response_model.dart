class HistoricalDataResponseModel {
  final Map<String, CurrencyHistoryModel> rates;

  HistoricalDataResponseModel({required this.rates});

  factory HistoricalDataResponseModel.fromJson(Map<String, dynamic> json) {
    final Map<String, CurrencyHistoryModel> mapped = {};

    json.forEach((pair, history) {
      mapped[pair] = CurrencyHistoryModel.fromJson(history);
    });

    return HistoricalDataResponseModel(rates: mapped);
  }

  Map<String, dynamic> toJson() {
    return rates.map((key, value) => MapEntry(key, value.toJson()));
  }
}

class CurrencyHistoryModel {
  final Map<DateTime, double> values;

  CurrencyHistoryModel({required this.values});

  factory CurrencyHistoryModel.fromJson(Map<String, dynamic> json) {
    final Map<DateTime, double> mapped = {};
    json.forEach((date, value) {
      mapped[DateTime.parse(date)] = (value as num).toDouble();
    });
    return CurrencyHistoryModel(values: mapped);
  }

  Map<String, dynamic> toJson() {
    return values.map(
      (key, value) => MapEntry(key.toIso8601String().split("T").first, value),
    );
  }
}




/* 
{
  "USD_PHP": {
    "2025-09-05": 57.186502,
    "2025-09-06": 56.995504,
    "2025-09-07": 56.703704,
    "2025-09-08": 56.703704,
    "2025-09-09": 56.860496,
    "2025-09-10": 56.772498,
    "2025-09-11": 57.074497
  },
  "PHP_USD": {
    "2025-09-05": 0.017487,
    "2025-09-06": 0.017545,
    "2025-09-07": 0.017636,
    "2025-09-08": 0.017636,
    "2025-09-09": 0.017582,
    "2025-09-10": 0.017614,
    "2025-09-11": 0.017521
  }
}
*/