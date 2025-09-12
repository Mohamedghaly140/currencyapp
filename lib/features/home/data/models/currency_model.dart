import 'package:json_annotation/json_annotation.dart';

part 'currency_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CurrencyModel {
  final String id;
  @JsonKey(name: 'currencyName')
  final String name;
  @JsonKey(name: 'currencySymbol')
  final String? symbol;
  final String? countryCode;

  String get flagUrl => countryCode != null
      ? "https://flagcdn.com/w20/${countryCode?.toLowerCase()}.png"
      : "";

  const CurrencyModel({
    required this.id,
    required this.name,
    required this.symbol,
    required this.countryCode,
  });

  factory CurrencyModel.fromJson(Map<String, dynamic> json) =>
      _$CurrencyModelFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyModelToJson(this);
}
