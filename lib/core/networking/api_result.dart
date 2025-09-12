import 'package:freezed_annotation/freezed_annotation.dart';

import 'api_error_model.dart';
part 'api_result.freezed.dart';

/// A union type that represents either a successful result of type [T]
/// or a failure with an [ApiErrorModel].
///
/// This is used to handle API responses in a type-safe way:
/// - [Success] contains the successful response data of type [T]
/// - [Failure] contains the error details in an [ApiErrorModel]
///
/// Example:
/// ```dart
/// ApiResult<User> result = await getUserProfile();
/// result.when(
///   success: (user) => print('Got user: ${user.name}'),
///   failure: (error) => print('Error: ${error.message}')
/// );
/// ```
@Freezed()
abstract class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T data) = Success<T>;
  const factory ApiResult.failure(ApiErrorModel apiErrorModel) = Failure<T>;
}
