import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_currency_converter_data_params.freezed.dart';
part 'request_currency_converter_data_params.g.dart';

@freezed
abstract class RequestCurrencyConverterDataParams
    with _$RequestCurrencyConverterDataParams {
  const factory RequestCurrencyConverterDataParams({
    required String targetCurrencyId,
    required String sourceCurrencyId,
    @Default('ultra') String compact,
  }) = _RequestCurrencyConverterDataParams;

  factory RequestCurrencyConverterDataParams.fromJson(
    Map<String, dynamic> json,
  ) => _$RequestCurrencyConverterDataParamsFromJson(json);
}
