import 'package:currencyapp/core/networking/api_result.dart';
import 'package:currencyapp/core/utils/enums/enums.dart';
import 'package:currencyapp/features/currency_converter/data/models/currency_converter_response_model.dart';
import 'package:currencyapp/features/currency_converter/data/models/request_currency_converter_data_params.dart';
import 'package:currencyapp/features/currency_converter/domain/usecases/get_currency_converter_data_usecase.dart';
import 'package:currencyapp/features/home/data/models/country_model.dart';
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

  void setSourceCountry(CountryModel country) {
    emit(state.copyWith(sourceCountry: country));
  }

  void setTargetCountry(CountryModel country) {
    emit(state.copyWith(targetCountry: country));
  }

  void setExchangeRate(double exchangeRate) {
    emit(state.copyWith(exchangeRate: exchangeRate));
  }

  void setEnteredAmount(double enteredAmount) {
    emit(
      state.copyWith(
        enteredAmount: enteredAmount,
        convertedAmount: enteredAmount * state.exchangeRate,
      ),
    );
  }

  Future<void> getCurrencyConverterData({required String currencyId}) async {
    emit(
      state.copyWith(getCurrencyConverterRequestState: RequestState.loading),
    );

    final params = RequestCurrencyConverterDataParams(currencyId: currencyId);

    final result = await _getCurrencyConverterDataUsecase.call(params);

    result.when(
      success: (data) {
        final exchangeRate =
            data.rates["${state.sourceCountry?.currencyId}_${state.targetCountry?.currencyId}"] ??
            0.0;
        print("exchangeRate: $exchangeRate");
        emit(
          state.copyWith(
            getCurrencyConverterRequestState: RequestState.loaded,
            currencyConverterData: data,
            exchangeRate: exchangeRate,
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

  void clearCubitState() {
    emit(const _CurrencyConverterState());
  }
}
