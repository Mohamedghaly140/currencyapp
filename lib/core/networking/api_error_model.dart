import 'package:json_annotation/json_annotation.dart';
part 'api_error_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ApiErrorModel {
  final int? status;
  @JsonKey(defaultValue: 'Unknown error occurred', name: 'error')
  final String? message;

  ApiErrorModel({this.status, required this.message});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);
}
