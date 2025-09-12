import 'package:currencyapp/core/config/app_config.dart';
import 'package:currencyapp/core/networking/api_error_handler.dart';
import 'package:currencyapp/core/networking/api_result.dart';
import 'package:currencyapp/core/utils/extensions/date.dart';
import 'package:currencyapp/features/historical_data/data/data_source/remote/historical_data_web_service.dart';
import 'package:currencyapp/features/historical_data/data/models/historical_data_response_model.dart';
import 'package:currencyapp/features/historical_data/data/models/request_currency_historical_data_params.dart';
import 'package:currencyapp/features/historical_data/domain/repositories/base_historical_data_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: BaseHistoricalDataRepository)
class HistoricalDataRepository implements BaseHistoricalDataRepository {
  final BaseHistoricalDataWebService _baseHistoricalDataWebService;

  HistoricalDataRepository(this._baseHistoricalDataWebService);

  @override
  Future<ApiResult<HistoricalDataResponseModel>> getHistoricalData(
    RequestCurrencyHistoricalDataParams params,
  ) async {
    try {
      final response = await _baseHistoricalDataWebService.getHistoricalData(
        apiKey: AppConfig.apiKey,
        q: "${params.currencyId}_PHP,PHP_${params.currencyId}",
        compact: params.compact,
        date: params.date.toYYYYMMDD(),
        endDate: params.endDate.toYYYYMMDD(),
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
