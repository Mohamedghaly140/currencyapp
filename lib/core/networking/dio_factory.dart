import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:currencyapp/core/config/app_config.dart';
import 'package:currencyapp/core/networking/app_interceptors.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 120);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut
        ..options.sendTimeout = timeOut
        ..options.baseUrl = AppConfig.apiUrl
        ..options.validateStatus = (status) {
          return status != null && status >= 200 && status < 300;
        }
        ..options.receiveDataWhenStatusError = true;

      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(AppIntercepter());
    if (kDebugMode) {
      dio?.interceptors.add(
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
