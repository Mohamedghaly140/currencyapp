import 'package:currencyapp/core/networking/end_points.dart';
import 'package:currencyapp/features/historical_data/data/models/historical_data_response_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'historical_data_web_service.g.dart';

abstract class BaseHistoricalDataWebService {
  Future<HistoricalDataResponseModel> getHistoricalData({
    @Query('apiKey') required String apiKey,
    @Query('q') required String q,
    @Query('compact') required String compact,
    @Query('date') required String date,
    @Query('endDate') required String endDate,
  });
}

@LazySingleton(as: BaseHistoricalDataWebService)
@RestApi()
abstract class HistoricalDataWebService
    implements BaseHistoricalDataWebService {
  @factoryMethod
  factory HistoricalDataWebService(Dio dio) = _HistoricalDataWebService;

  @override
  @GET(EndPoints.convert)
  Future<HistoricalDataResponseModel> getHistoricalData({
    @Query('apiKey') required String apiKey,
    @Query('q') required String q,
    @Query('compact') required String compact,
    @Query('date') required String date,
    @Query('endDate') required String endDate,
  });
}
