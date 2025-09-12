part of 'currency_converter_cubit.dart';

@freezed
abstract class CurrencyConverterState with _$CurrencyConverterState {
  const factory CurrencyConverterState({
    // get currencies request state
    @Default(RequestState.initial)
    RequestState getCurrencyConverterRequestState,
    // currency converter data
    @Default(null) CurrencyConverterResponseModel? currencyConverterData,
    // source currency
    @Default(null) CountryModel? sourceCountry,
    // target country
    @Default(
      CountryModel(
        alpha3: "USA",
        currencyId: "USD",
        currencyName: "United States dollar",
        currencySymbol: "\$",
        id: "US",
        name: "United States of America",
      ),
    )
    CountryModel targetCountry,
    // exchange rate
    @Default(0.0) double exchangeRate,
    // converted amount
    @Default(0.0) double convertedAmount,
    // entered amount
    @Default(0.0) double enteredAmount,
    // error message
    @Default(null) String? errorMessage,
  }) = _CurrencyConverterState;
}
