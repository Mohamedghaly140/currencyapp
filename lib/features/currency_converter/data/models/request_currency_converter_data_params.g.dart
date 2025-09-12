// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_currency_converter_data_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RequestCurrencyConverterDataParams
_$RequestCurrencyConverterDataParamsFromJson(Map<String, dynamic> json) =>
    _RequestCurrencyConverterDataParams(
      currencyId: json['currencyId'] as String,
      compact: json['compact'] as String? ?? 'ultra',
    );

Map<String, dynamic> _$RequestCurrencyConverterDataParamsToJson(
  _RequestCurrencyConverterDataParams instance,
) => <String, dynamic>{
  'currencyId': instance.currencyId,
  'compact': instance.compact,
};
