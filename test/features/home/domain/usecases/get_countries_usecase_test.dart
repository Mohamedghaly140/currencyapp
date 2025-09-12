import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:currencyapp/features/home/domain/usecases/get_countries_usecase.dart';
import 'package:currencyapp/features/home/domain/repositories/base_currency_repository.dart';
import 'package:currencyapp/features/home/data/models/countries_response_model.dart';
import 'package:currencyapp/core/networking/api_result.dart';
import 'package:currencyapp/core/networking/api_error_model.dart';
import 'package:currencyapp/core/usecases/usecases.dart';
import '../../../../helpers/test_data.dart';

class MockBaseCurrencyRepository extends Mock
    implements BaseCurrencyRepository {}

void main() {
  group('GetCountriesUseCase', () {
    late GetCountriesUseCase getCountriesUseCase;
    late MockBaseCurrencyRepository mockRepository;

    setUp(() {
      mockRepository = MockBaseCurrencyRepository();
      getCountriesUseCase = GetCountriesUseCase(
        baseCurrencyRepository: mockRepository,
      );
    });

    group('call', () {
      test('should return success when repository returns success', () async {
        // Arrange
        final expectedResponse = TestData.countriesResponseModel;
        when(
          () => mockRepository.getCountries(),
        ).thenAnswer((_) async => ApiResult.success(expectedResponse));

        // Act
        final result = await getCountriesUseCase.call(NoParams());

        // Assert
        expect(result, isA<Success<CountriesResponseModel>>());
        result.when(
          success: (response) {
            expect(response, equals(expectedResponse));
            expect(response.results.length, equals(4));
            expect(response.results.containsKey('AF'), isTrue);
            expect(response.results.containsKey('AI'), isTrue);
            expect(response.results.containsKey('US'), isTrue);
            expect(response.results.containsKey('EG'), isTrue);

            // Verify specific country data
            final afghanistan = response.results['AF'];
            expect(afghanistan, isNotNull);
            expect(afghanistan!.name, equals('Afghanistan'));
            expect(afghanistan.currencyId, equals('AFN'));
            expect(afghanistan.currencySymbol, equals('؋'));
          },
          failure: (_) => fail('Should not return failure'),
        );

        // Verify repository was called exactly once
        verify(() => mockRepository.getCountries()).called(1);
      });

      test('should return failure when repository returns failure', () async {
        // Arrange
        const expectedError = ApiErrorModel(message: 'Network error');
        when(
          () => mockRepository.getCountries(),
        ).thenAnswer((_) async => const ApiResult.failure(expectedError));

        // Act
        final result = await getCountriesUseCase.call(NoParams());

        // Assert
        expect(result, isA<Failure<CountriesResponseModel>>());
        result.when(
          success: (_) => fail('Should not return success'),
          failure: (error) {
            expect(error, equals(expectedError));
            expect(error.message, equals('Network error'));
          },
        );

        // Verify repository was called exactly once
        verify(() => mockRepository.getCountries()).called(1);
      });

      test(
        'should return success with empty results when repository returns empty data',
        () async {
          // Arrange
          final emptyResponse = TestData.emptyCountriesResponse;
          when(
            () => mockRepository.getCountries(),
          ).thenAnswer((_) async => ApiResult.success(emptyResponse));

          // Act
          final result = await getCountriesUseCase.call(NoParams());

          // Assert
          expect(result, isA<Success<CountriesResponseModel>>());
          result.when(
            success: (response) {
              expect(response.results.isEmpty, isTrue);
            },
            failure: (_) => fail('Should not return failure'),
          );

          verify(() => mockRepository.getCountries()).called(1);
        },
      );

      test(
        'should return success with single country when repository returns single country',
        () async {
          // Arrange
          final singleCountryResponse = TestData.singleCountryResponse;
          when(
            () => mockRepository.getCountries(),
          ).thenAnswer((_) async => ApiResult.success(singleCountryResponse));

          // Act
          final result = await getCountriesUseCase.call(NoParams());

          // Assert
          expect(result, isA<Success<CountriesResponseModel>>());
          result.when(
            success: (response) {
              expect(response.results.length, equals(1));
              expect(response.results.containsKey('US'), isTrue);

              final usa = response.results['US'];
              expect(usa, isNotNull);
              expect(usa!.name, equals('United States of America'));
              expect(usa.currencyId, equals('USD'));
            },
            failure: (_) => fail('Should not return failure'),
          );

          verify(() => mockRepository.getCountries()).called(1);
        },
      );

      test('should handle different error types from repository', () async {
        // Test connection error
        const connectionError = ApiErrorModel(message: 'Connection error');
        when(
          () => mockRepository.getCountries(),
        ).thenAnswer((_) async => const ApiResult.failure(connectionError));

        var result = await getCountriesUseCase.call(NoParams());
        expect(result, isA<Failure<CountriesResponseModel>>());
        result.when(
          success: (_) => fail('Should not return success'),
          failure: (error) => expect(error.message, equals('Connection error')),
        );

        // Test timeout error
        const timeoutError = ApiErrorModel(
          message: 'Connection timeout with server',
        );
        when(
          () => mockRepository.getCountries(),
        ).thenAnswer((_) async => const ApiResult.failure(timeoutError));

        result = await getCountriesUseCase.call(NoParams());
        expect(result, isA<Failure<CountriesResponseModel>>());
        result.when(
          success: (_) => fail('Should not return success'),
          failure: (error) =>
              expect(error.message, equals('Connection timeout with server')),
        );

        // Test server error
        const serverError = ApiErrorModel(
          message: 'Server temporary unavailable',
        );
        when(
          () => mockRepository.getCountries(),
        ).thenAnswer((_) async => const ApiResult.failure(serverError));

        result = await getCountriesUseCase.call(NoParams());
        expect(result, isA<Failure<CountriesResponseModel>>());
        result.when(
          success: (_) => fail('Should not return success'),
          failure: (error) =>
              expect(error.message, equals('Server temporary unavailable')),
        );

        // Verify all calls were made
        verify(() => mockRepository.getCountries()).called(3);
      });

      test('should handle unauthorized error from repository', () async {
        // Arrange
        const unauthorizedError = ApiErrorModel(
          status: 401,
          message: 'Unauthorized access',
        );
        when(
          () => mockRepository.getCountries(),
        ).thenAnswer((_) async => const ApiResult.failure(unauthorizedError));

        // Act
        final result = await getCountriesUseCase.call(NoParams());

        // Assert
        expect(result, isA<Failure<CountriesResponseModel>>());
        result.when(
          success: (_) => fail('Should not return success'),
          failure: (error) {
            expect(error.status, equals(401));
            expect(error.message, equals('Unauthorized access'));
          },
        );

        verify(() => mockRepository.getCountries()).called(1);
      });

      test('should handle bad request error from repository', () async {
        // Arrange
        const badRequestError = ApiErrorModel(
          status: 400,
          message: 'Invalid API key',
        );
        when(
          () => mockRepository.getCountries(),
        ).thenAnswer((_) async => const ApiResult.failure(badRequestError));

        // Act
        final result = await getCountriesUseCase.call(NoParams());

        // Assert
        expect(result, isA<Failure<CountriesResponseModel>>());
        result.when(
          success: (_) => fail('Should not return success'),
          failure: (error) {
            expect(error.status, equals(400));
            expect(error.message, equals('Invalid API key'));
          },
        );

        verify(() => mockRepository.getCountries()).called(1);
      });

      test('should handle data parsing error from repository', () async {
        // Arrange
        const parsingError = ApiErrorModel(
          message: 'We are having trouble displaying some information',
        );
        when(
          () => mockRepository.getCountries(),
        ).thenAnswer((_) async => const ApiResult.failure(parsingError));

        // Act
        final result = await getCountriesUseCase.call(NoParams());

        // Assert
        expect(result, isA<Failure<CountriesResponseModel>>());
        result.when(
          success: (_) => fail('Should not return success'),
          failure: (error) {
            expect(
              error.message,
              equals('We are having trouble displaying some information'),
            );
          },
        );

        verify(() => mockRepository.getCountries()).called(1);
      });

      test('should maintain data integrity through the use case', () async {
        // Arrange
        final expectedResponse = TestData.countriesResponseModel;
        when(
          () => mockRepository.getCountries(),
        ).thenAnswer((_) async => ApiResult.success(expectedResponse));

        // Act
        final result = await getCountriesUseCase.call(NoParams());

        // Assert
        expect(result, isA<Success<CountriesResponseModel>>());
        result.when(
          success: (response) {
            // Verify all countries are present
            expect(
              response.results.length,
              equals(expectedResponse.results.length),
            );

            // Verify each country's data integrity
            for (final key in expectedResponse.results.keys) {
              final expected = expectedResponse.results[key]!;
              final actual = response.results[key]!;

              expect(actual.id, equals(expected.id));
              expect(actual.name, equals(expected.name));
              expect(actual.alpha3, equals(expected.alpha3));
              expect(actual.currencyId, equals(expected.currencyId));
              expect(actual.currencyName, equals(expected.currencyName));
              expect(actual.currencySymbol, equals(expected.currencySymbol));
            }
          },
          failure: (_) => fail('Should not return failure'),
        );

        verify(() => mockRepository.getCountries()).called(1);
      });

      test('should work with NoParams parameter', () async {
        // Arrange
        final expectedResponse = TestData.countriesResponseModel;
        when(
          () => mockRepository.getCountries(),
        ).thenAnswer((_) async => ApiResult.success(expectedResponse));

        // Act - Test with different NoParams instances
        final result1 = await getCountriesUseCase.call(NoParams());
        final result2 = await getCountriesUseCase.call(NoParams());

        // Assert
        expect(result1, isA<Success<CountriesResponseModel>>());
        expect(result2, isA<Success<CountriesResponseModel>>());

        // Both calls should return the same data structure
        result1.when(
          success: (response1) {
            result2.when(
              success: (response2) {
                expect(
                  response1.results.length,
                  equals(response2.results.length),
                );
                expect(response1.results.keys, equals(response2.results.keys));
              },
              failure: (_) => fail('Second call should not fail'),
            );
          },
          failure: (_) => fail('First call should not fail'),
        );

        verify(() => mockRepository.getCountries()).called(2);
      });

      test('should handle large dataset correctly', () async {
        // Arrange
        final largeDataset = TestData.generateLargeCountriesResponse(100);
        final largeResponse = CountriesResponseModel.fromJson(largeDataset);
        when(
          () => mockRepository.getCountries(),
        ).thenAnswer((_) async => ApiResult.success(largeResponse));

        // Act
        final result = await getCountriesUseCase.call(NoParams());

        // Assert
        expect(result, isA<Success<CountriesResponseModel>>());
        result.when(
          success: (response) {
            expect(response.results.length, equals(100));

            // Verify some random entries
            expect(response.results.containsKey('C00'), isTrue);
            expect(response.results.containsKey('C50'), isTrue);
            expect(response.results.containsKey('C99'), isTrue);

            // Verify data structure is maintained
            final firstCountry = response.results['C00'];
            expect(firstCountry, isNotNull);
            expect(firstCountry!.name, equals('Country 0'));
            expect(firstCountry.currencyName, equals('Currency 0'));
          },
          failure: (_) => fail('Should not return failure'),
        );

        verify(() => mockRepository.getCountries()).called(1);
      });
    });

    group('error propagation', () {
      test('should propagate repository errors without modification', () async {
        // Arrange
        const originalError = ApiErrorModel(
          status: 503,
          message: 'Service temporarily unavailable',
        );
        when(
          () => mockRepository.getCountries(),
        ).thenAnswer((_) async => const ApiResult.failure(originalError));

        // Act
        final result = await getCountriesUseCase.call(NoParams());

        // Assert
        expect(result, isA<Failure<CountriesResponseModel>>());
        result.when(
          success: (_) => fail('Should not return success'),
          failure: (error) {
            // Error should be exactly the same as from repository
            expect(error, equals(originalError));
            expect(error.status, equals(originalError.status));
            expect(error.message, equals(originalError.message));
          },
        );

        verify(() => mockRepository.getCountries()).called(1);
      });

      test('should not catch or handle repository exceptions', () async {
        // Arrange
        when(
          () => mockRepository.getCountries(),
        ).thenThrow(Exception('Unexpected error'));

        // Act & Assert
        expect(
          () => getCountriesUseCase.call(NoParams()),
          throwsA(isA<Exception>()),
        );

        verify(() => mockRepository.getCountries()).called(1);
      });
    });

    group('use case contract', () {
      test('should implement UseCase interface correctly', () {
        // Assert
        expect(
          getCountriesUseCase,
          isA<UseCase<CountriesResponseModel, NoParams>>(),
        );
      });

      test('should accept only NoParams as parameter type', () async {
        // Arrange
        final expectedResponse = TestData.countriesResponseModel;
        when(
          () => mockRepository.getCountries(),
        ).thenAnswer((_) async => ApiResult.success(expectedResponse));

        // Act
        final result = await getCountriesUseCase.call(NoParams());

        // Assert
        expect(result, isA<Success<CountriesResponseModel>>());
        verify(() => mockRepository.getCountries()).called(1);
      });

      test('should return ApiResult<CountriesResponseModel>', () async {
        // Arrange
        final expectedResponse = TestData.countriesResponseModel;
        when(
          () => mockRepository.getCountries(),
        ).thenAnswer((_) async => ApiResult.success(expectedResponse));

        // Act
        final result = await getCountriesUseCase.call(NoParams());

        // Assert
        expect(result, isA<ApiResult<CountriesResponseModel>>());
        expect(result, isA<Success<CountriesResponseModel>>());
      });
    });

    group('repository interaction', () {
      test('should call repository exactly once per use case call', () async {
        // Arrange
        final expectedResponse = TestData.countriesResponseModel;
        when(
          () => mockRepository.getCountries(),
        ).thenAnswer((_) async => ApiResult.success(expectedResponse));

        // Act
        await getCountriesUseCase.call(NoParams());

        // Assert
        verify(() => mockRepository.getCountries()).called(1);
        verifyNoMoreInteractions(mockRepository);
      });

      test(
        'should not call repository methods other than getCountries',
        () async {
          // Arrange
          final expectedResponse = TestData.countriesResponseModel;
          when(
            () => mockRepository.getCountries(),
          ).thenAnswer((_) async => ApiResult.success(expectedResponse));

          // Act
          await getCountriesUseCase.call(NoParams());

          // Assert
          verify(() => mockRepository.getCountries()).called(1);

          // Verify no other methods were called on getCurrencies (not available in this repository)
          verifyNoMoreInteractions(mockRepository);
        },
      );

      test('should handle multiple consecutive calls correctly', () async {
        // Arrange
        final expectedResponse = TestData.countriesResponseModel;
        when(
          () => mockRepository.getCountries(),
        ).thenAnswer((_) async => ApiResult.success(expectedResponse));

        // Act
        await getCountriesUseCase.call(NoParams());
        await getCountriesUseCase.call(NoParams());
        await getCountriesUseCase.call(NoParams());

        // Assert
        verify(() => mockRepository.getCountries()).called(3);
      });
    });
  });
}
