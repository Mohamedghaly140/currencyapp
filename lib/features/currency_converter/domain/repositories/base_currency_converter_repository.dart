import 'package:currencyapp/core/networking/api_result.dart';
import 'package:currencyapp/features/currency_converter/data/models/request_currency_converter_data_params.dart';
import 'package:currencyapp/features/currency_converter/data/models/currency_converter_response_model.dart';

abstract class BaseCurrencyConverterRepository {
  Future<ApiResult<CurrencyConverterResponseModel>> getCurrencyRate(
    RequestCurrencyConverterDataParams params,
  );
}
