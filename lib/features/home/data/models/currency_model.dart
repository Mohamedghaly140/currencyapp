import 'package:json_annotation/json_annotation.dart';

part 'currency_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CurrencyModel {
  final String id;
  @JsonKey(name: 'currencyName')
  final String name;
  @JsonKey(name: 'currencySymbol')
  final String? symbol;

  const CurrencyModel({
    required this.id,
    required this.name,
    required this.symbol,
  });

  factory CurrencyModel.fromJson(Map<String, dynamic> json) =>
      _$CurrencyModelFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyModelToJson(this);
}
