import 'package:currencyapp/core/networking/api_result.dart';
import 'package:currencyapp/features/historical_data/data/models/request_currency_historical_data_params.dart';

abstract class BaseHistoricalDataRepository {
  Future<ApiResult<void>> getHistoricalData(
    RequestCurrencyHistoricalDataParams params,
  );
}
