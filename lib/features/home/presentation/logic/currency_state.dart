part of 'currency_cubit.dart';

@freezed
abstract class CurrencyState with _$CurrencyState {
  const factory CurrencyState({
    // get currencies request state
    @Default(RequestState.initial) RequestState getCurrencyRequestState,
    // get countries request state
    @Default(RequestState.initial) RequestState getCountryRequestState,
    // currencies
    @Default([]) List<CurrencyModel> currencies,
    // countries
    @Default([]) List<CountryModel> countries,
    // error message
    @Default(null) String? errorMessage,
  }) = _CurrencyState;
}
