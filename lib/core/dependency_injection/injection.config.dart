// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/home/data/data_source/remote/currency_web_service.dart'
    as _i591;
import '../../features/home/data/repository/currency_repository.dart' as _i492;
import '../../features/home/domain/repositories/base_currency_repository.dart'
    as _i299;
import '../../features/home/domain/usecases/get_countries_usecase.dart'
    as _i151;
import '../../features/home/domain/usecases/get_currencies_usecase.dart'
    as _i935;
import '../../features/home/presentation/logic/currency_cubit.dart' as _i532;
import '../database/database.dart' as _i660;
import '../helpers/cache_helper.dart' as _i52;
import '../networking/dio_factory.dart' as _i103;
import 'injectable_module.dart' as _i109;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final injectableModule = _$InjectableModule();
    gh.factory<_i103.DioFactory>(() => _i103.DioFactory());
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => injectableModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i660.AppDatabase>(() => injectableModule.appDatabase);
    gh.factory<_i52.CacheHelper>(
      () => _i52.CacheHelper(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () => injectableModule.dio(gh<_i103.DioFactory>()),
    );
    gh.lazySingleton<_i591.BaseCurrencyWebService>(
      () => _i591.CurrencyWebService.new(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i299.BaseCurrencyRepository>(
      () => _i492.CurrencyRepository(
        gh<_i591.BaseCurrencyWebService>(),
        gh<_i660.AppDatabase>(),
      ),
    );
    gh.lazySingleton<_i935.GetCurrenciesUseCase>(
      () => _i935.GetCurrenciesUseCase(
        baseCurrencyRepository: gh<_i299.BaseCurrencyRepository>(),
      ),
    );
    gh.lazySingleton<_i151.GetCountriesUseCase>(
      () => _i151.GetCountriesUseCase(
        baseCurrencyRepository: gh<_i299.BaseCurrencyRepository>(),
      ),
    );
    gh.lazySingleton<_i532.CurrencyCubit>(
      () => _i532.CurrencyCubit(
        getCurrenciesUseCase: gh<_i935.GetCurrenciesUseCase>(),
        getCountriesUseCase: gh<_i151.GetCountriesUseCase>(),
      ),
    );
    return this;
  }
}

class _$InjectableModule extends _i109.InjectableModule {}
