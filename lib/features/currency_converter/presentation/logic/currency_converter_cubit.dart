import 'package:currencyapp/core/networking/api_result.dart';
import 'package:currencyapp/core/utils/enums/enums.dart';
import 'package:currencyapp/features/currency_converter/data/models/currency_converter_response_model.dart';
import 'package:currencyapp/features/currency_converter/data/models/request_currency_converter_data_params.dart';
import 'package:currencyapp/features/currency_converter/domain/usecases/get_currency_converter_data_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'currency_converter_cubit.freezed.dart';
part 'currency_converter_state.dart';

@lazySingleton
class CurrencyConverterCubit extends Cubit<CurrencyConverterState> {
  final GetCurrencyConverterDataUsecase _getCurrencyConverterDataUsecase;

  CurrencyConverterCubit(this._getCurrencyConverterDataUsecase)
    : super(const _CurrencyConverterState());

  Future<void> getCurrencyConverterData({required String currencyId}) async {
    emit(
      state.copyWith(getCurrencyConverterRequestState: RequestState.loading),
    );

    final params = RequestCurrencyConverterDataParams(currencyId: currencyId);

    final result = await _getCurrencyConverterDataUsecase.call(params);

    result.when(
      success: (data) {
        emit(
          state.copyWith(
            getCurrencyConverterRequestState: RequestState.loaded,
            currencyConverterData: data,
            errorMessage: null,
          ),
        );
      },
      failure: (error) {
        emit(
          state.copyWith(
            getCurrencyConverterRequestState: RequestState.error,
            errorMessage: error.message,
          ),
        );
      },
    );
  }
}
