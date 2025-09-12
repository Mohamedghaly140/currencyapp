import 'package:currencyapp/core/networking/api_result.dart';
import 'package:currencyapp/core/usecases/usecases.dart';
import 'package:currencyapp/features/home/data/models/countries_response_model.dart';
import 'package:currencyapp/features/home/domain/repositories/base_currency_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCountriesUseCase implements UseCase<CountriesResponseModel, NoParams> {
  final BaseCurrencyRepository baseCurrencyRepository;

  GetCountriesUseCase({required this.baseCurrencyRepository});

  @override
  Future<ApiResult<CountriesResponseModel>> call(NoParams params) async {
    return baseCurrencyRepository.getCountries();
  }
}
