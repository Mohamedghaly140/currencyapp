import 'package:currencyapp/core/config/app_config.dart';
import 'package:currencyapp/core/database/database.dart';
import 'package:currencyapp/core/networking/api_error_handler.dart';
import 'package:currencyapp/core/networking/api_result.dart';
import 'package:currencyapp/features/home/data/data_source/remote/currency_web_service.dart';
import 'package:currencyapp/features/home/data/models/countries_response_model.dart';
import 'package:currencyapp/features/home/data/models/country_model.dart';
import 'package:currencyapp/features/home/data/models/currencies_response_model.dart';
import 'package:currencyapp/features/home/domain/repositories/base_currency_repository.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: BaseCurrencyRepository)
class CurrencyRepository implements BaseCurrencyRepository {
  final BaseCurrencyWebService _baseCurrencyWebService;
  final AppDatabase _appDatabase;

  CurrencyRepository(this._baseCurrencyWebService, this._appDatabase);

  @override
  Future<ApiResult<CurrencyResponseModel>> getCurrencies() async {
    try {
      final response = await _baseCurrencyWebService.getCurrencies(
        apiKey: AppConfig.apiKey,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<CountriesResponseModel>> getCountries() async {
    try {
      final countries = await _appDatabase
          .select(_appDatabase.countriesDb)
          .get();

      // Check if we have data and if it's still fresh (less than 7 days old)
      if (countries.isNotEmpty && _isDataFresh(countries)) {
        return ApiResult.success(
          CountriesResponseModel(
            results: Map.fromEntries(
              countries.map(
                (e) => MapEntry(e.id ?? '', CountryModel.fromJson(e.toJson())),
              ),
            ),
          ),
        );
      }

      // Data is either empty or expired, fetch fresh data from API
      final response = await _baseCurrencyWebService.getCountries(
        apiKey: AppConfig.apiKey,
      );
      // For testing purposes
      // final response = CountriesResponseModel.fromJson({
      //   "results": {
      //     "US": {
      //       "alpha3": "USA",
      //       "currencyId": "USD",
      //       "currencyName": "United States Dollar",
      //       "currencySymbol": "\$",
      //       "name": "United States of America",
      //       "id": "US",
      //     },
      //     "EG": {
      //       "alpha3": "EGY",
      //       "currencyId": "EGP",
      //       "currencyName": "Egyptian Pound",
      //       "currencySymbol": "£",
      //       "name": "Egypt",
      //       "id": "EG",
      //     },
      //   },
      // });

      // Clear old data and insert fresh data
      await _appDatabase.batch((batch) {
        // Delete all existing records
        batch.deleteAll(_appDatabase.countriesDb);

        // Insert fresh data
        batch.insertAll(
          _appDatabase.countriesDb,
          response.results.entries.map(
            (entry) => CountriesDbCompanion.insert(
              id: Value(entry.key),
              alpha3: Value(entry.value.alpha3),
              currencyId: Value(entry.value.currencyId),
              currencyName: Value(entry.value.currencyName),
              currencySymbol: Value(entry.value.currencySymbol),
              name: Value(entry.value.name),
            ),
          ),
        );
      });

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// Checks if the cached data is still fresh (less than 7 days old)
  bool _isDataFresh(List<CountriesDbData> countries) {
    if (countries.isEmpty) return false;

    // Get the most recent record's creation time
    final mostRecentCreatedAt = countries
        .map((country) => country.createdAt)
        .reduce((a, b) => a.isAfter(b) ? a : b);

    // Check if it's less than 7 days old
    final sevenDaysAgo = DateTime.now().subtract(const Duration(days: 7));
    return mostRecentCreatedAt.isAfter(sevenDaysAgo);
  }
}
