// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_currency_historical_data_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RequestCurrencyHistoricalDataParams
_$RequestCurrencyHistoricalDataParamsFromJson(Map<String, dynamic> json) =>
    _RequestCurrencyHistoricalDataParams(
      currencyId: json['currencyId'] as String,
      date: DateTime.parse(json['date'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      compact: json['compact'] as String? ?? 'ultra',
    );

Map<String, dynamic> _$RequestCurrencyHistoricalDataParamsToJson(
  _RequestCurrencyHistoricalDataParams instance,
) => <String, dynamic>{
  'currencyId': instance.currencyId,
  'date': instance.date.toIso8601String(),
  'endDate': instance.endDate.toIso8601String(),
  'compact': instance.compact,
};
