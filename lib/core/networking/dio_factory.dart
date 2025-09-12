import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:currencyapp/core/config/app_config.dart';
import 'package:currencyapp/core/networking/app_interceptors.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@injectable
class DioFactory {
  Dio? _dio;

  Dio getDio() {
    Duration timeOut = const Duration(seconds: 120);

    if (_dio == null) {
      _dio = Dio();
      _dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut
        ..options.sendTimeout = timeOut
        ..options.baseUrl = AppConfig.apiUrl
        ..options.validateStatus = (status) {
          return status != null && status >= 200 && status < 300;
        }
        ..options.receiveDataWhenStatusError = true;

      _addDioInterceptor();
      return _dio!;
    } else {
      return _dio!;
    }
  }

  void _addDioInterceptor() {
    _dio?.interceptors.add(AppIntercepter());
    if (kDebugMode) {
      _dio?.interceptors.add(
        PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseHeader: true,
          responseBody: true,
          enabled: kDebugMode,
        ),
      );
    }
  }
}
