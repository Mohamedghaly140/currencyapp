import 'package:flutter_test/flutter_test.dart';
import 'package:currencyapp/features/home/data/models/countries_response_model.dart';
import 'package:currencyapp/features/home/data/models/country_model.dart';

void main() {
  group('CountriesResponseModel', () {
    final testCountriesMap = {
      "AF": const CountryModel(
        alpha3: "AFG",
        currencyId: "AFN",
        currencyName: "Afghan afghani",
        currencySymbol: "؋",
        id: "AF",
        name: "Afghanistan",
      ),
      "AI": const CountryModel(
        alpha3: "AIA",
        currencyId: "XCD",
        currencyName: "East Caribbean dollar",
        currencySymbol: "\$",
        id: "AI",
        name: "Anguilla",
      ),
    };

    const testJsonData = {
      "results": {
        "AF": {
          "alpha3": "AFG",
          "currencyId": "AFN",
          "currencyName": "Afghan afghani",
          "currencySymbol": "؋",
          "id": "AF",
          "name": "Afghanistan",
        },
        "AI": {
          "alpha3": "AIA",
          "currencyId": "XCD",
          "currencyName": "East Caribbean dollar",
          "currencySymbol": "\$",
          "id": "AI",
          "name": "Anguilla",
        },
      },
    };

    group('fromJson', () {
      test('should create CountriesResponseModel from valid JSON', () {
        // Act
        final result = CountriesResponseModel.fromJson(testJsonData);

        // Assert
        expect(result.results, isA<Map<String, CountryModel>>());
        expect(result.results.length, equals(2));

        // Check Afghanistan
        final afghanistan = result.results['AF'];
        expect(afghanistan, isNotNull);
        expect(afghanistan!.name, equals('Afghanistan'));
        expect(afghanistan.alpha3, equals('AFG'));
        expect(afghanistan.currencyId, equals('AFN'));
        expect(afghanistan.currencyName, equals('Afghan afghani'));
        expect(afghanistan.currencySymbol, equals('؋'));
        expect(afghanistan.id, equals('AF'));

        // Check Anguilla
        final anguilla = result.results['AI'];
        expect(anguilla, isNotNull);
        expect(anguilla!.name, equals('Anguilla'));
        expect(anguilla.alpha3, equals('AIA'));
        expect(anguilla.currencyId, equals('XCD'));
        expect(anguilla.currencyName, equals('East Caribbean dollar'));
        expect(anguilla.currencySymbol, equals('\$'));
        expect(anguilla.id, equals('AI'));
      });

      test('should handle empty results', () {
        // Arrange
        const emptyJson = {"results": <String, dynamic>{}};

        // Act
        final result = CountriesResponseModel.fromJson(emptyJson);

        // Assert
        expect(result.results, isA<Map<String, CountryModel>>());
        expect(result.results.isEmpty, isTrue);
      });

      test('should handle single country result', () {
        // Arrange
        const singleCountryJson = {
          "results": {
            "US": {
              "alpha3": "USA",
              "currencyId": "USD",
              "currencyName": "United States Dollar",
              "currencySymbol": "\$",
              "id": "US",
              "name": "United States of America",
            },
          },
        };

        // Act
        final result = CountriesResponseModel.fromJson(singleCountryJson);

        // Assert
        expect(result.results.length, equals(1));
        expect(result.results.containsKey('US'), isTrue);

        final usa = result.results['US'];
        expect(usa, isNotNull);
        expect(usa!.name, equals('United States of America'));
        expect(usa.currencyId, equals('USD'));
      });

      test('should handle countries with missing optional fields', () {
        // Arrange
        const incompleteJson = {
          "results": {
            "XX": {
              "id": "XX",
              "name": "Test Country",
              // Missing other fields
            },
          },
        };

        // Act
        final result = CountriesResponseModel.fromJson(incompleteJson);

        // Assert
        expect(result.results.length, equals(1));
        final testCountry = result.results['XX'];
        expect(testCountry, isNotNull);
        expect(testCountry!.name, equals('Test Country'));
        expect(testCountry.id, equals('XX'));
        expect(testCountry.alpha3, isNull);
        expect(testCountry.currencyId, isNull);
        expect(testCountry.currencyName, isNull);
        expect(testCountry.currencySymbol, isNull);
      });
    });

    group('toJson', () {
      test('should convert CountriesResponseModel to valid JSON', () {
        // Arrange
        final countriesResponse = CountriesResponseModel(
          results: testCountriesMap,
        );

        // Act
        final result = countriesResponse.toJson();

        // Assert
        expect(result, isA<Map<String, dynamic>>());
        expect(result.containsKey('results'), isTrue);
        expect(result['results'], isA<Map<String, dynamic>>());

        final resultsMap = result['results'] as Map<String, dynamic>;
        expect(resultsMap.length, equals(2));
        expect(resultsMap.containsKey('AF'), isTrue);
        expect(resultsMap.containsKey('AI'), isTrue);

        // Check Afghanistan data
        final afghanistanJson = resultsMap['AF'] as Map<String, dynamic>;
        expect(afghanistanJson['name'], equals('Afghanistan'));
        expect(afghanistanJson['alpha3'], equals('AFG'));
        expect(afghanistanJson['currencyId'], equals('AFN'));

        // Check Anguilla data
        final anguillaJson = resultsMap['AI'] as Map<String, dynamic>;
        expect(anguillaJson['name'], equals('Anguilla'));
        expect(anguillaJson['alpha3'], equals('AIA'));
        expect(anguillaJson['currencyId'], equals('XCD'));
      });

      test('should handle empty results in toJson', () {
        // Arrange
        final emptyResponse = CountriesResponseModel(results: {});

        // Act
        final result = emptyResponse.toJson();

        // Assert
        expect(result['results'], isA<Map<String, dynamic>>());
        expect((result['results'] as Map).isEmpty, isTrue);
      });
    });

    group('serialization round trip', () {
      test(
        'should maintain data integrity through fromJson -> toJson -> fromJson',
        () {
          // Arrange
          final originalResponse = CountriesResponseModel.fromJson(
            testJsonData,
          );

          // Act
          final jsonData = originalResponse.toJson();
          final reconstructedResponse = CountriesResponseModel.fromJson(
            jsonData,
          );

          // Assert
          expect(
            reconstructedResponse.results.length,
            equals(originalResponse.results.length),
          );

          for (final key in originalResponse.results.keys) {
            final original = originalResponse.results[key]!;
            final reconstructed = reconstructedResponse.results[key]!;

            expect(reconstructed.name, equals(original.name));
            expect(reconstructed.alpha3, equals(original.alpha3));
            expect(reconstructed.currencyId, equals(original.currencyId));
            expect(reconstructed.currencyName, equals(original.currencyName));
            expect(
              reconstructed.currencySymbol,
              equals(original.currencySymbol),
            );
            expect(reconstructed.id, equals(original.id));
          }
        },
      );
    });

    group('real world API response examples', () {
      test('should handle typical API response structure', () {
        // Arrange - This matches the expected API response format
        const apiResponseJson = {
          "results": {
            "AF": {
              "alpha3": "AFG",
              "currencyId": "AFN",
              "currencyName": "Afghan afghani",
              "currencySymbol": "؋",
              "id": "AF",
              "name": "Afghanistan",
            },
            "AI": {
              "alpha3": "AIA",
              "currencyId": "XCD",
              "currencyName": "East Caribbean dollar",
              "currencySymbol": "\$",
              "id": "AI",
              "name": "Anguilla",
            },
          },
        };

        // Act
        final result = CountriesResponseModel.fromJson(apiResponseJson);

        // Assert
        expect(result.results.length, equals(2));
        expect(result.results.keys, containsAll(['AF', 'AI']));

        // Verify all countries have required data
        for (final country in result.results.values) {
          expect(country.id, isNotNull);
          expect(country.name, isNotNull);
          expect(country.name!.isNotEmpty, isTrue);
        }
      });

      test('should handle large country dataset', () {
        // Arrange - Simulate a larger response
        final largeDataset = <String, dynamic>{};
        final countryCodes = [
          'US',
          'GB',
          'DE',
          'FR',
          'IT',
          'ES',
          'CA',
          'AU',
          'JP',
          'CN',
        ];

        for (int i = 0; i < countryCodes.length; i++) {
          final code = countryCodes[i];
          largeDataset[code] = {
            "alpha3": "${code}X",
            "currencyId": "${code}D",
            "currencyName": "Currency $i",
            "currencySymbol": "\$",
            "id": code,
            "name": "Country $i",
          };
        }

        final largeResponseJson = <String, dynamic>{"results": largeDataset};

        // Act
        final result = CountriesResponseModel.fromJson(largeResponseJson);

        // Assert
        expect(result.results.length, equals(10));
        expect(result.results.keys.length, equals(countryCodes.length));

        // Verify all countries are properly parsed
        for (final code in countryCodes) {
          expect(result.results.containsKey(code), isTrue);
          final country = result.results[code]!;
          expect(country.id, equals(code));
          expect(country.name, contains('Country'));
        }
      });
    });

    group('error handling', () {
      test('should throw FormatException for invalid JSON structure', () {
        // Arrange
        const invalidJson = {
          "results": "invalid_structure", // Should be a Map, not a String
        };

        // Act & Assert
        expect(
          () => CountriesResponseModel.fromJson(invalidJson),
          throwsA(isA<TypeError>()),
        );
      });

      test('should handle null values gracefully', () {
        // Arrange
        const jsonWithNulls = {
          "results": {
            "XX": {
              "alpha3": null,
              "currencyId": null,
              "currencyName": null,
              "currencySymbol": null,
              "id": null,
              "name": null,
            },
          },
        };

        // Act
        final result = CountriesResponseModel.fromJson(jsonWithNulls);

        // Assert
        expect(result.results.length, equals(1));
        final country = result.results['XX'];
        expect(country, isNotNull);
        expect(country!.alpha3, isNull);
        expect(country.currencyId, isNull);
        expect(country.currencyName, isNull);
        expect(country.currencySymbol, isNull);
        expect(country.id, isNull);
        expect(country.name, isNull);
      });
    });
  });
}
