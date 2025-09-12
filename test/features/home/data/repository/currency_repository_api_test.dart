import 'package:currencyapp/core/database/database.dart';
import 'package:currencyapp/features/home/data/repository/currency_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:currencyapp/features/home/data/data_source/remote/currency_web_service.dart';
import 'package:currencyapp/features/home/data/models/countries_response_model.dart';
import 'package:currencyapp/core/networking/api_error_model.dart';
import 'package:currencyapp/core/networking/api_result.dart';
import 'package:drift/native.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/test_data.dart';

// Mock class
class MockCurrencyWebService extends Mock implements BaseCurrencyWebService {}

void main() {
  late MockCurrencyWebService mockWebService;
  late CurrencyRepository currencyRepository;

  setUp(() {
    mockWebService = MockCurrencyWebService();
    currencyRepository = CurrencyRepository(
      mockWebService,
      AppDatabase(NativeDatabase.memory()),
    );
  });

  group('CurrencyRepository API Tests', () {
    test('should return countries on success', () async {
      // Arrange
      when(
        () => mockWebService.getCountries(apiKey: any(named: 'apiKey')),
      ).thenAnswer((_) async => TestData.countriesResponseModel);

      // Act
      final result = await currencyRepository.getCountries();

      // Assert
      expect(result, isA<Success<CountriesResponseModel>>());
      result.when(
        success: (data) {
          expect(data.results.length, equals(4));
          expect(data.results.containsKey('US'), isTrue);
          expect(data.results['US']!.currencyId, equals('USD'));
        },
        failure: (_) => fail('Expected success'),
      );

      verify(
        () => mockWebService.getCountries(apiKey: any(named: 'apiKey')),
      ).called(1);
    });

    test('should handle empty response', () async {
      // Arrange
      when(
        () => mockWebService.getCountries(apiKey: any(named: 'apiKey')),
      ).thenAnswer((_) async => TestData.emptyCountriesResponse);

      // Act
      final result = await currencyRepository.getCountries();

      // Assert
      expect(result, isA<Success<CountriesResponseModel>>());
      result.when(
        success: (data) => expect(data.results.isEmpty, isTrue),
        failure: (_) => fail('Expected success'),
      );
      verify(
        () => mockWebService.getCountries(apiKey: any(named: 'apiKey')),
      ).called(1);
    });

    test('should return Failure on error', () async {
      // Arrange
      when(
        () => mockWebService.getCountries(apiKey: any(named: 'apiKey')),
      ).thenThrow(Exception('network error'));

      // Act & Assert
      final result = await currencyRepository.getCountries();
      expect(result, isA<Failure<CountriesResponseModel>>());
      result.when(
        success: (_) => fail('Expected failure'),
        failure: (error) => expect(error, isA<ApiErrorModel>()),
      );
      verify(
        () => mockWebService.getCountries(apiKey: any(named: 'apiKey')),
      ).called(1);
    });
  });
}
