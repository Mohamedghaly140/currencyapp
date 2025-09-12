import 'package:currencyapp/core/networking/api_result.dart';
import 'package:currencyapp/core/usecases/usecases.dart';
import 'package:currencyapp/features/historical_data/data/models/historical_data_response_model.dart';
import 'package:currencyapp/features/historical_data/data/models/request_currency_historical_data_params.dart';
import 'package:currencyapp/features/historical_data/domain/repositories/base_historical_data_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCurrencyHistoricalDataUsecase
    implements
        UseCase<
          HistoricalDataResponseModel,
          RequestCurrencyHistoricalDataParams
        > {
  final BaseHistoricalDataRepository baseHistoricalDataRepository;

  GetCurrencyHistoricalDataUsecase({
    required this.baseHistoricalDataRepository,
  });

  @override
  Future<ApiResult<HistoricalDataResponseModel>> call(
    RequestCurrencyHistoricalDataParams params,
  ) async {
    return baseHistoricalDataRepository.getHistoricalData(params);
  }
}
