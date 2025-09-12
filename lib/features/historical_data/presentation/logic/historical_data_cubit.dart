import 'package:currencyapp/core/utils/enums/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'historical_data_cubit.freezed.dart';
part 'historical_data_state.dart';

@lazySingleton
class HistoricalDataCubit extends Cubit<HistoricalDataState> {
  HistoricalDataCubit() : super(const _HistoricalDataState());
}
