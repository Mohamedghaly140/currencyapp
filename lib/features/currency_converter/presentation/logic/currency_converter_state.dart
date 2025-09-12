part of 'currency_converter_cubit.dart';

@freezed
abstract class CurrencyConverterState with _$CurrencyConverterState {
  const factory CurrencyConverterState({
    // get currencies request state
    @Default(RequestState.initial)
    RequestState getCurrencyConverterRequestState,
    // currency converter data
    @Default(null) CurrencyConverterResponseModel? currencyConverterData,
    // error message
    @Default(null) String? errorMessage,
  }) = _CurrencyConverterState;
}
