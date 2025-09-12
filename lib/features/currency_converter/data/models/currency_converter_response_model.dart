class CurrencyConverterResponseModel {
  final Map<String, double> rates;

  CurrencyConverterResponseModel({required this.rates});

  factory CurrencyConverterResponseModel.fromJson(Map<String, dynamic> json) {
    final Map<String, double> mapped = {};
    json.forEach((pair, value) {
      mapped[pair] = (value as num).toDouble();
    });
    return CurrencyConverterResponseModel(rates: mapped);
  }

  Map<String, dynamic> toJson() {
    return rates.map((key, value) => MapEntry(key, value));
  }
}
