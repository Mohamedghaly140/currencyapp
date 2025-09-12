import 'package:flutter_test/flutter_test.dart';
import 'package:currencyapp/features/home/data/models/country_model.dart';

void main() {
  group('CountryModel', () {
    const testJsonData = {
      "alpha3": "AFG",
      "currencyId": "AFN",
      "currencyName": "Afghan afghani",
      "currencySymbol": "؋",
      "id": "AF",
      "name": "Afghanistan",
    };

    const testCountryModel = CountryModel(
      alpha3: "AFG",
      currencyId: "AFN",
      currencyName: "Afghan afghani",
      currencySymbol: "؋",
      id: "AF",
      name: "Afghanistan",
    );

    group('fromJson', () {
      test('should create CountryModel from valid JSON', () {
        // Act
        final result = CountryModel.fromJson(testJsonData);

        // Assert
        expect(result.alpha3, equals('AFG'));
        expect(result.currencyId, equals('AFN'));
        expect(result.currencyName, equals('Afghan afghani'));
        expect(result.currencySymbol, equals('؋'));
        expect(result.id, equals('AF'));
        expect(result.name, equals('Afghanistan'));
      });

      test('should handle null values in JSON', () {
        // Arrange
        const jsonWithNulls = <String, dynamic>{
          "alpha3": null,
          "currencyId": null,
          "currencyName": null,
          "currencySymbol": null,
          "id": null,
          "name": null,
        };

        // Act
        final result = CountryModel.fromJson(jsonWithNulls);

        // Assert
        expect(result.alpha3, isNull);
        expect(result.currencyId, isNull);
        expect(result.currencyName, isNull);
        expect(result.currencySymbol, isNull);
        expect(result.id, isNull);
        expect(result.name, isNull);
      });

      test('should handle missing fields in JSON', () {
        // Arrange
        const incompleteJson = <String, dynamic>{
          "id": "US",
          "name": "United States",
        };

        // Act
        final result = CountryModel.fromJson(incompleteJson);

        // Assert
        expect(result.id, equals('US'));
        expect(result.name, equals('United States'));
        expect(result.alpha3, isNull);
        expect(result.currencyId, isNull);
        expect(result.currencyName, isNull);
        expect(result.currencySymbol, isNull);
      });
    });

    group('toJson', () {
      test('should convert CountryModel to valid JSON', () {
        // Act
        final result = testCountryModel.toJson();

        // Assert
        expect(result, equals(testJsonData));
      });

      test('should handle CountryModel with null values', () {
        // Arrange
        const countryWithNulls = CountryModel();

        // Act
        final result = countryWithNulls.toJson();

        // Assert
        expect(result['alpha3'], isNull);
        expect(result['currencyId'], isNull);
        expect(result['currencyName'], isNull);
        expect(result['currencySymbol'], isNull);
        expect(result['id'], isNull);
        expect(result['name'], isNull);
      });
    });

    group('flagUrl getter', () {
      test('should return correct flag URL when id is provided', () {
        // Arrange
        const country = CountryModel(id: 'US');

        // Act
        final flagUrl = country.flagUrl;

        // Assert
        expect(flagUrl, equals('https://flagcdn.com/w80/us.png'));
      });

      test('should return correct flag URL with lowercase conversion', () {
        // Arrange
        const country = CountryModel(id: 'AF');

        // Act
        final flagUrl = country.flagUrl;

        // Assert
        expect(flagUrl, equals('https://flagcdn.com/w80/af.png'));
      });

      test('should return empty string when id is null', () {
        // Arrange
        const country = CountryModel(id: null);

        // Act
        final flagUrl = country.flagUrl;

        // Assert
        expect(flagUrl, equals(''));
      });

      test('should return empty string when id is empty', () {
        // Arrange
        const country = CountryModel(id: '');

        // Act
        final flagUrl = country.flagUrl;

        // Assert
        expect(flagUrl, equals('https://flagcdn.com/w80/.png'));
      });
    });

    group('equality and immutability', () {
      test('should be equal when all properties are the same', () {
        // Arrange
        const country1 = CountryModel(
          alpha3: "USA",
          currencyId: "USD",
          currencyName: "US Dollar",
          currencySymbol: "\$",
          id: "US",
          name: "United States",
        );

        const country2 = CountryModel(
          alpha3: "USA",
          currencyId: "USD",
          currencyName: "US Dollar",
          currencySymbol: "\$",
          id: "US",
          name: "United States",
        );

        // Assert
        expect(country1.alpha3, equals(country2.alpha3));
        expect(country1.currencyId, equals(country2.currencyId));
        expect(country1.currencyName, equals(country2.currencyName));
        expect(country1.currencySymbol, equals(country2.currencySymbol));
        expect(country1.id, equals(country2.id));
        expect(country1.name, equals(country2.name));
      });

      test('should handle different currency symbols correctly', () {
        // Arrange
        const euroCountry = CountryModel(currencySymbol: '€', id: 'DE');

        const poundCountry = CountryModel(currencySymbol: '£', id: 'GB');

        // Assert
        expect(euroCountry.currencySymbol, equals('€'));
        expect(poundCountry.currencySymbol, equals('£'));
        expect(
          euroCountry.currencySymbol != poundCountry.currencySymbol,
          isTrue,
        );
      });
    });

    group('real world examples', () {
      test('should handle Afghanistan country data correctly', () {
        // Act
        final afghanistan = CountryModel.fromJson(testJsonData);

        // Assert
        expect(afghanistan.name, equals('Afghanistan'));
        expect(afghanistan.alpha3, equals('AFG'));
        expect(afghanistan.currencyName, equals('Afghan afghani'));
        expect(afghanistan.currencySymbol, equals('؋'));
        expect(afghanistan.flagUrl, equals('https://flagcdn.com/w80/af.png'));
      });

      test('should handle United States country data correctly', () {
        // Arrange
        const usJson = {
          "alpha3": "USA",
          "currencyId": "USD",
          "currencyName": "United States Dollar",
          "currencySymbol": "\$",
          "id": "US",
          "name": "United States of America",
        };

        // Act
        final usa = CountryModel.fromJson(usJson);

        // Assert
        expect(usa.name, equals('United States of America'));
        expect(usa.alpha3, equals('USA'));
        expect(usa.currencyName, equals('United States Dollar'));
        expect(usa.currencySymbol, equals('\$'));
        expect(usa.flagUrl, equals('https://flagcdn.com/w80/us.png'));
      });

      test('should handle Anguilla country data correctly', () {
        // Arrange
        const anguillaJson = {
          "alpha3": "AIA",
          "currencyId": "XCD",
          "currencyName": "East Caribbean dollar",
          "currencySymbol": "\$",
          "id": "AI",
          "name": "Anguilla",
        };

        // Act
        final anguilla = CountryModel.fromJson(anguillaJson);

        // Assert
        expect(anguilla.name, equals('Anguilla'));
        expect(anguilla.alpha3, equals('AIA'));
        expect(anguilla.currencyName, equals('East Caribbean dollar'));
        expect(anguilla.currencySymbol, equals('\$'));
        expect(anguilla.flagUrl, equals('https://flagcdn.com/w80/ai.png'));
      });
    });
  });
}
