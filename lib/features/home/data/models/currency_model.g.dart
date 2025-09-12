// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyModel _$CurrencyModelFromJson(Map<String, dynamic> json) =>
    CurrencyModel(
      id: json['id'] as String,
      name: json['currencyName'] as String,
      symbol: json['currencySymbol'] as String?,
      countryCode: json['countryCode'] as String?,
    );

Map<String, dynamic> _$CurrencyModelToJson(CurrencyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'currencyName': instance.name,
      'currencySymbol': instance.symbol,
      'countryCode': instance.countryCode,
    };
