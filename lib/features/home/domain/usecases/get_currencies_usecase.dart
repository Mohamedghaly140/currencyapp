import 'package:currencyapp/core/networking/api_result.dart';
import 'package:currencyapp/core/usecases/usecases.dart';
import 'package:currencyapp/features/home/data/models/currencies_response_model.dart';
import 'package:currencyapp/features/home/domain/repositories/base_currency_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCurrenciesUseCase implements UseCase<CurrencyResponseModel, NoParams> {
  final BaseCurrencyRepository baseCurrencyRepository;

  GetCurrenciesUseCase({required this.baseCurrencyRepository});

  @override
  Future<ApiResult<CurrencyResponseModel>> call(NoParams params) async {
    return baseCurrencyRepository.getCurrencies();
  }
}
