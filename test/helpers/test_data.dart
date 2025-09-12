import 'package:currencyapp/features/home/data/models/country_model.dart';
import 'package:currencyapp/features/home/data/models/countries_response_model.dart';

class TestData {
  // Sample country models
  static const afghanistanModel = CountryModel(
    alpha3: "AFG",
    currencyId: "AFN",
    currencyName: "Afghan afghani",
    currencySymbol: "؋",
    id: "AF",
    name: "Afghanistan",
  );

  static const anguillaModel = CountryModel(
    alpha3: "AIA",
    currencyId: "XCD",
    currencyName: "East Caribbean dollar",
    currencySymbol: "\$",
    id: "AI",
    name: "Anguilla",
  );

  static const usaModel = CountryModel(
    alpha3: "USA",
    currencyId: "USD",
    currencyName: "United States Dollar",
    currencySymbol: "\$",
    id: "US",
    name: "United States of America",
  );

  static const egyptModel = CountryModel(
    alpha3: "EGY",
    currencyId: "EGP",
    currencyName: "Egyptian Pound",
    currencySymbol: "£",
    id: "EG",
    name: "Egypt",
  );

  // Sample JSON responses
  static const Map<String, dynamic> afghanistanJson = {
    "alpha3": "AFG",
    "currencyId": "AFN",
    "currencyName": "Afghan afghani",
    "currencySymbol": "؋",
    "id": "AF",
    "name": "Afghanistan",
  };

  static const Map<String, dynamic> anguillaJson = {
    "alpha3": "AIA",
    "currencyId": "XCD",
    "currencyName": "East Caribbean dollar",
    "currencySymbol": "\$",
    "id": "AI",
    "name": "Anguilla",
  };

  static const Map<String, dynamic> usaJson = {
    "alpha3": "USA",
    "currencyId": "USD",
    "currencyName": "United States Dollar",
    "currencySymbol": "\$",
    "id": "US",
    "name": "United States of America",
  };

  static const Map<String, dynamic> egyptJson = {
    "alpha3": "EGY",
    "currencyId": "EGP",
    "currencyName": "Egyptian Pound",
    "currencySymbol": "£",
    "id": "EG",
    "name": "Egypt",
  };

  // Sample API response JSON
  static const Map<String, dynamic> countriesApiResponseJson = {
    "results": {
      "AF": afghanistanJson,
      "AI": anguillaJson,
      "US": usaJson,
      "EG": egyptJson,
    },
  };

  // Sample response models
  static final countriesResponseModel = CountriesResponseModel(
    results: {
      "AF": afghanistanModel,
      "AI": anguillaModel,
      "US": usaModel,
      "EG": egyptModel,
    },
  );

  // Empty response
  static final emptyCountriesResponse = CountriesResponseModel(results: {});

  // Single country response
  static final singleCountryResponse = CountriesResponseModel(
    results: {"US": usaModel},
  );

  // Large dataset for performance testing
  static Map<String, dynamic> generateLargeCountriesResponse(int count) {
    final results = <String, dynamic>{};
    for (int i = 0; i < count; i++) {
      final code = 'C${i.toString().padLeft(2, '0')}';
      results[code] = {
        "alpha3": "${code}X",
        "currencyId": "${code}D",
        "currencyName": "Currency $i",
        "currencySymbol": "\$",
        "id": code,
        "name": "Country $i",
      };
    }
    return {"results": results};
  }

  // Error response examples
  static const Map<String, dynamic> errorResponseJson = {
    "status": 400,
    "error": "Invalid API key",
  };

  static const Map<String, dynamic> serverErrorResponseJson = {
    "status": 500,
    "error": "Internal server error",
  };

  static const Map<String, dynamic> unauthorizedResponseJson = {
    "status": 401,
    "error": "Unauthorized access",
  };

  // Invalid JSON structures for testing error handling
  static const Map<String, dynamic> invalidStructureJson = {
    "results": "invalid_structure", // Should be a Map
  };

  static const Map<String, dynamic> missingResultsJson = {
    "data": {}, // Missing 'results' key
  };

  // API key for testing
  static const String testApiKey = "test_api_key_123";
  static const String invalidApiKey = "invalid_key";
}
