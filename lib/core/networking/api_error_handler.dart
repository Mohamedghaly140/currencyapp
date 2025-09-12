import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:currencyapp/core/helpers/debug_helper.dart';

import 'api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          return ApiErrorModel(message: "Connection error");
        case DioExceptionType.cancel:
          return ApiErrorModel(message: "Request to server cancelled");
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(message: "Connection timeout with server");
        case DioExceptionType.unknown:
          return ApiErrorModel(
            message: "Connection to server failed due to internet connection",
          );
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(
            message: "Receive timeout in connection with server",
          );
        case DioExceptionType.badResponse:
          if (error.response?.statusCode != null) {
            if (error.response!.statusCode! >= 500) {
              if (error.response?.data != null &&
                  error.response?.data['message'] != null) {
                return _handleError(error.response?.data);
              }
              return ApiErrorModel(message: "Server temporary unavailable");
            }
          }
          return _handleError(error.response?.data);
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(
            message: "Send timeout in connection with server",
          );
        default:
          return ApiErrorModel(message: "Something went wrong");
      }
    } else if (error is FormatException) {
      log('Data Parsing Error: ${error.toString()}', name: 'ApiErrorHandler');
      return ApiErrorModel(
        message: 'We are having trouble displaying some information',
        errorCode: 'PARSING_ERROR',
        data: [error.toString()],
      );
    } else if (error is TypeError) {
      log('Model Parsing Error: ${error.toString()}', name: 'ApiErrorHandler');
      // Check if it's a type casting error
      if (error.toString().contains('is not a subtype of')) {
        return ApiErrorModel(
          message: 'We are having trouble displaying some information',
          errorCode: 'PARSING_ERROR',
          data: [error.toString()],
        );
      }
      return ApiErrorModel(message: 'Invalid data format');
    } else {
      return ApiErrorModel(message: "Unknown error occurred");
    }
  }
}

ApiErrorModel _handleError(dynamic data) {
  DebugHelper.log('ApiErrorHandler => data: $data , type: ${data.runtimeType}');
  return ApiErrorModel.fromJson(data);
}
