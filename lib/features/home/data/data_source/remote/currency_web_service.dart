import 'package:currencyapp/core/networking/end_points.dart';
import 'package:currencyapp/features/home/data/models/currencies_response_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'currency_web_service.g.dart';

abstract class BaseCurrencyWebService {
  Future<CurrencyResponseModel> getCurrencies({
    @Query('apiKey') required String apiKey,
  });
}

@LazySingleton(as: BaseCurrencyWebService)
@RestApi()
abstract class CurrencyWebService implements BaseCurrencyWebService {
  @factoryMethod
  factory CurrencyWebService(Dio dio) = _CurrencyWebService;

  @override
  @GET(EndPoints.currencies)
  Future<CurrencyResponseModel> getCurrencies({
    @Query('apiKey') required String apiKey,
  });
}
