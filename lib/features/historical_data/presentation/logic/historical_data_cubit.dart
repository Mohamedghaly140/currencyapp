import 'package:currencyapp/core/networking/api_result.dart';
import 'package:currencyapp/core/utils/enums/enums.dart';
import 'package:currencyapp/features/historical_data/data/models/historical_data_response_model.dart';
import 'package:currencyapp/features/historical_data/data/models/request_currency_historical_data_params.dart';
import 'package:currencyapp/features/historical_data/domain/usecases/get_currency_historical_data_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'historical_data_cubit.freezed.dart';
part 'historical_data_state.dart';

@lazySingleton
class HistoricalDataCubit extends Cubit<HistoricalDataState> {
  final GetCurrencyHistoricalDataUsecase _getCurrencyHistoricalDataUsecase;

  HistoricalDataCubit(this._getCurrencyHistoricalDataUsecase)
    : super(const _HistoricalDataState());

  Future<void> getHistoricalData({
    required String currencyId,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    emit(state.copyWith(getHistoricalDataRequestState: RequestState.loading));

    final params = RequestCurrencyHistoricalDataParams(
      currencyId: currencyId,
      date: startDate ?? DateTime.now().subtract(const Duration(days: 6)),
      endDate: endDate ?? DateTime.now(),
    );

    final result = await _getCurrencyHistoricalDataUsecase.call(params);

    result.when(
      success: (data) {
        emit(
          state.copyWith(
            getHistoricalDataRequestState: RequestState.loaded,
            historicalData: data,
            errorMessage: null,
          ),
        );
      },
      failure: (error) {
        emit(
          state.copyWith(
            getHistoricalDataRequestState: RequestState.error,
            errorMessage: error.message,
          ),
        );
      },
    );
  }
}
