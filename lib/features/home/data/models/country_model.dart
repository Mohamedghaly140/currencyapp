import 'package:json_annotation/json_annotation.dart';

part 'country_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CountryModel {
  final String? alpha3;
  final String? currencyId;
  final String? currencyName;
  final String? currencySymbol;
  final String? id;
  final String? name;

  String get flagUrl =>
      id != null ? "https://flagcdn.com/w80/${id?.toLowerCase()}.png" : "";

  const CountryModel({
    this.alpha3,
    this.currencyId,
    this.currencyName,
    this.currencySymbol,
    this.id,
    this.name,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) =>
      _$CountryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CountryModelToJson(this);
}
// {
// "alpha3": "AFG",
// "currencyId": "AFN",
// "currencyName": "Afghan afghani",
// "currencySymbol": "؋",
// "id": "AF",
// "name": "Afghanistan"
// }