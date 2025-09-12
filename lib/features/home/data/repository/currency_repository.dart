import 'package:currencyapp/core/config/app_config.dart';
import 'package:currencyapp/core/networking/api_error_handler.dart';
import 'package:currencyapp/core/networking/api_result.dart';
import 'package:currencyapp/features/home/data/data_source/remote/currency_web_service.dart';
import 'package:currencyapp/features/home/data/models/countries_response_model.dart';
import 'package:currencyapp/features/home/data/models/currencies_response_model.dart';
import 'package:currencyapp/features/home/domain/repositories/base_currency_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: BaseCurrencyRepository)
class CurrencyRepository implements BaseCurrencyRepository {
  final BaseCurrencyWebService _baseCurrencyWebService;

  CurrencyRepository(this._baseCurrencyWebService);

  @override
  Future<ApiResult<CurrencyResponseModel>> getCurrencies() async {
    try {
      final response = await _baseCurrencyWebService.getCurrencies(
        apiKey: AppConfig.apiKey,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<CountriesResponseModel>> getCountries() async {
    try {
      final response = await _baseCurrencyWebService.getCountries(
        apiKey: AppConfig.apiKey,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
