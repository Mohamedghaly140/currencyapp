// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'countries_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountriesResponseModel _$CountriesResponseModelFromJson(
  Map<String, dynamic> json,
) => CountriesResponseModel(
  results: (json['results'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(k, CountryModel.fromJson(e as Map<String, dynamic>)),
  ),
);

Map<String, dynamic> _$CountriesResponseModelToJson(
  CountriesResponseModel instance,
) => <String, dynamic>{
  'results': instance.results.map((k, e) => MapEntry(k, e.toJson())),
};
