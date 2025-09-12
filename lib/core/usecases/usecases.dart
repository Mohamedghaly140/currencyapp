import 'package:currencyapp/core/networking/api_result.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  Future<ApiResult<Type>> call(Params params);
}

abstract class Parameters {
  Map<String, dynamic> toJson();
}

abstract class ParametersFuture {
  Future<Map<String, dynamic>> toJson();
}

class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object?> get props => [];
}
