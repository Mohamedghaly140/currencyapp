import 'package:currencyapp/core/networking/api_result.dart';
import 'package:currencyapp/core/usecases/usecases.dart';
import 'package:currencyapp/features/currency_converter/data/models/currency_converter_response_model.dart';
import 'package:currencyapp/features/currency_converter/data/models/request_currency_converter_data_params.dart';
import 'package:currencyapp/features/currency_converter/domain/repositories/base_currency_converter_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCurrencyConverterDataUsecase
    implements
        UseCase<
          CurrencyConverterResponseModel,
          RequestCurrencyConverterDataParams
        > {
  final BaseCurrencyConverterRepository baseCurrencyConverterRepository;

  GetCurrencyConverterDataUsecase({
    required this.baseCurrencyConverterRepository,
  });

  @override
  Future<ApiResult<CurrencyConverterResponseModel>> call(
    RequestCurrencyConverterDataParams params,
  ) async {
    return baseCurrencyConverterRepository.getCurrencyRate(params);
  }
}
