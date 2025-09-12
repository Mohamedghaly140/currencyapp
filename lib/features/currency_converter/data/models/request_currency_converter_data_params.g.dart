// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_currency_converter_data_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RequestCurrencyConverterDataParams
_$RequestCurrencyConverterDataParamsFromJson(Map<String, dynamic> json) =>
    _RequestCurrencyConverterDataParams(
      targetCurrencyId: json['targetCurrencyId'] as String,
      sourceCurrencyId: json['sourceCurrencyId'] as String,
      compact: json['compact'] as String? ?? 'ultra',
    );

Map<String, dynamic> _$RequestCurrencyConverterDataParamsToJson(
  _RequestCurrencyConverterDataParams instance,
) => <String, dynamic>{
  'targetCurrencyId': instance.targetCurrencyId,
  'sourceCurrencyId': instance.sourceCurrencyId,
  'compact': instance.compact,
};
