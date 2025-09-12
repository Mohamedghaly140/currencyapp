import 'package:currencyapp/core/networking/api_result.dart';
import 'package:currencyapp/features/home/data/models/currencies_response_model.dart';

abstract class BaseCurrencyRepository {
  Future<ApiResult<CurrencyResponseModel>> getCurrencies();
}
