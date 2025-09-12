part of 'currency_cubit.dart';

@freezed
abstract class CurrencyState with _$CurrencyState {
  const factory CurrencyState({
    // get currencies request state
    @Default(RequestState.initial) RequestState getCurrencyRequestState,
    // currencies
    @Default([]) List<CurrencyModel> currencies,
    // error message
    @Default(null) String? errorMessage,
  }) = _CurrencyState;
}
