// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiErrorModel _$ApiErrorModelFromJson(Map<String, dynamic> json) =>
    ApiErrorModel(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      message: json['message'] as String? ?? 'Unknown error occurred',
      errorCode: json['errorCode'] as String?,
      data: json['data'],
      status: json['status'] as String?,
      path: json['path'] as String?,
      timestamp: json['timestamp'] as String?,
      stack: json['stack'] as String?,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$ApiErrorModelToJson(ApiErrorModel instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'errorCode': instance.errorCode,
      'data': instance.data,
      'status': instance.status,
      'path': instance.path,
      'timestamp': instance.timestamp,
      'stack': instance.stack,
      'error': instance.error,
    };
