import 'package:json_annotation/json_annotation.dart';
part 'api_error_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ApiErrorModel {
  final int? statusCode;
  @JsonKey(defaultValue: 'Unknown error occurred')
  final String message;
  final String? errorCode;
  final dynamic data;
  final String? status;
  final String? path;
  final String? timestamp;
  final String? stack;
  final String? error;

  ApiErrorModel({
    this.statusCode,
    required this.message,
    this.errorCode,
    this.data,
    this.status,
    this.path,
    this.timestamp,
    this.stack,
    this.error,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);
}
