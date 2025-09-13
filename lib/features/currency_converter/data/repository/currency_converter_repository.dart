import 'package:currencyapp/core/config/app_config.dart';
import 'package:currencyapp/core/helpers/debug_helper.dart';
import 'package:currencyapp/core/networking/api_error_handler.dart';
import 'package:currencyapp/core/networking/api_result.dart';
import 'package:currencyapp/features/currency_converter/data/data_source/remote/currency_converter_web_service.dart';
import 'package:currencyapp/features/currency_converter/data/models/currency_converter_response_model.dart';
import 'package:currencyapp/features/currency_converter/data/models/request_currency_converter_data_params.dart';
import 'package:currencyapp/features/currency_converter/domain/repositories/base_currency_converter_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: BaseCurrencyConverterRepository)
class CurrencyConverterRepository implements BaseCurrencyConverterRepository {
  final BaseCurrencyConverterWebService _baseCurrencyConverterWebService;

  CurrencyConverterRepository(this._baseCurrencyConverterWebService);

  @override
  Future<ApiResult<CurrencyConverterResponseModel>> getCurrencyRate(
    RequestCurrencyConverterDataParams params,
  ) async {
    try {
      // await Future.delayed(const Duration(seconds: 1));
      final response = await _baseCurrencyConverterWebService.getCurrencyRate(
        apiKey: AppConfig.apiKey,
        q: "${params.targetCurrencyId}_${params.sourceCurrencyId},${params.sourceCurrencyId}_${params.targetCurrencyId}",
        compact: params.compact,
      );
      // For testing only to reduce the number of requests
      // final res = CurrencyConverterResponseModel.fromJson({
      //   "${params.targetCurrencyId}_${params.sourceCurrencyId}": 48.5,
      //   "${params.sourceCurrencyId}_${params.targetCurrencyId}": 0.0206,
      // });
      DebugHelper.printOnlyInDebug("res: ${response.toJson()}");
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
