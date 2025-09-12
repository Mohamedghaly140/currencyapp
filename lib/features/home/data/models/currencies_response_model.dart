import 'package:currencyapp/features/home/data/models/currency_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'currencies_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CurrencyResponseModel {
  final Map<String, CurrencyModel> results;

  CurrencyResponseModel({required this.results});

  factory CurrencyResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CurrencyResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyResponseModelToJson(this);
}
