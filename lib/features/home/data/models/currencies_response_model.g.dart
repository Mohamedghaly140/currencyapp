// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currencies_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyResponseModel _$CurrencyResponseModelFromJson(
  Map<String, dynamic> json,
) => CurrencyResponseModel(
  results: (json['results'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(k, CurrencyModel.fromJson(e as Map<String, dynamic>)),
  ),
);

Map<String, dynamic> _$CurrencyResponseModelToJson(
  CurrencyResponseModel instance,
) => <String, dynamic>{
  'results': instance.results.map((k, e) => MapEntry(k, e.toJson())),
};
