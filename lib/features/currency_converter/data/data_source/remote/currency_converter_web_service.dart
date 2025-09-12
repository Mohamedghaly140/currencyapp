import 'package:currencyapp/core/networking/end_points.dart';
import 'package:currencyapp/features/currency_converter/data/models/currency_converter_response_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'currency_converter_web_service.g.dart';

abstract class BaseCurrencyConverterWebService {
  Future<CurrencyConverterResponseModel> getCurrencyRate({
    @Query('apiKey') required String apiKey,
    @Query('q') required String q,
    @Query('compact') required String compact,
  });
}

@LazySingleton(as: BaseCurrencyConverterWebService)
@RestApi()
abstract class CurrencyConverterWebService
    implements BaseCurrencyConverterWebService {
  @factoryMethod
  factory CurrencyConverterWebService(Dio dio) = _CurrencyConverterWebService;

  @override
  @GET(EndPoints.convert)
  Future<CurrencyConverterResponseModel> getCurrencyRate({
    @Query('apiKey') required String apiKey,
    @Query('q') required String q,
    @Query('compact') required String compact,
  });
}
