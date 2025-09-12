import 'package:currencyapp/core/helpers/debug_helper.dart';
import 'package:dio/dio.dart';

class AppIntercepter extends Interceptor {
  AppIntercepter();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    DebugHelper.log("headers => ${options.headers}");

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    DebugHelper.log(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    DebugHelper.log(
      'RESPONSE[${err.response?.statusCode}] => PATH: ${err.response?.requestOptions.path}',
    );
    return handler.next(err);
  }
}
