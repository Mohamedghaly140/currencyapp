import 'package:currencyapp/features/home/data/models/country_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'countries_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CountriesResponseModel {
  final Map<String, CountryModel> results;

  CountriesResponseModel({required this.results});

  factory CountriesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CountriesResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CountriesResponseModelToJson(this);
}
