import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_currency_historical_data_params.freezed.dart';
part 'request_currency_historical_data_params.g.dart';

@freezed
abstract class RequestCurrencyHistoricalDataParams
    with _$RequestCurrencyHistoricalDataParams {
  const factory RequestCurrencyHistoricalDataParams({
    required String currencyId,
    required DateTime date,
    required DateTime endDate,
    @Default('ultra') String compact,
  }) = _RequestCurrencyHistoricalDataParams;

  factory RequestCurrencyHistoricalDataParams.fromJson(
    Map<String, dynamic> json,
  ) => _$RequestCurrencyHistoricalDataParamsFromJson(json);
}
