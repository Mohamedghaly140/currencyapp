import 'package:currencyapp/core/networking/api_result.dart';
import 'package:currencyapp/core/usecases/usecases.dart';
import 'package:currencyapp/features/home/data/models/currency_model.dart';
import 'package:currencyapp/features/home/domain/usecases/get_currencies_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:currencyapp/core/utils/enums/enums.dart';
import 'package:injectable/injectable.dart';

part 'currency_state.dart';
part 'currency_cubit.freezed.dart';

@lazySingleton
class CurrencyCubit extends Cubit<CurrencyState> {
  final GetCurrenciesUseCase getCurrenciesUseCase;

  CurrencyCubit({required this.getCurrenciesUseCase})
    : super(const _CurrencyState());

  Future<void> getCurrencies() async {
    emit(state.copyWith(getCurrencyRequestState: RequestState.loading));
    final result = await getCurrenciesUseCase.call(NoParams());
    result.when(
      success: (data) {
        emit(
          state.copyWith(
            currencies: data.currencies,
            getCurrencyRequestState: RequestState.loaded,
          ),
        );
      },
      failure: (error) {
        emit(
          state.copyWith(
            getCurrencyRequestState: RequestState.error,
            errorMessage: error.message,
          ),
        );
      },
    );
  }
}
