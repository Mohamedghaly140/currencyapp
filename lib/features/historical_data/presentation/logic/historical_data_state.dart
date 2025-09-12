part of 'historical_data_cubit.dart';

@freezed
abstract class HistoricalDataState with _$HistoricalDataState {
  const factory HistoricalDataState({
    // get currencies request state
    @Default(RequestState.initial) RequestState getHistoricalDataRequestState,
    // historical data
    @Default(null) HistoricalDataResponseModel? historicalData,
    // error message
    @Default(null) String? errorMessage,
  }) = _HistoricalDataState;
}
