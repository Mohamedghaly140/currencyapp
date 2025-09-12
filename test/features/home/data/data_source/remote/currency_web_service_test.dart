import 'package:currencyapp/core/networking/end_points.dart';
import 'package:currencyapp/features/home/data/data_source/remote/currency_web_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../helpers/test_data.dart';

class MockDio extends Mock implements Dio {}

void main() {
  setUpAll(() {
    registerFallbackValue(RequestOptions(path: ''));
  });

  group('CurrencyWebService', () {
    late MockDio mockDio;
    late CurrencyWebService currencyWebService;

    setUp(() {
      mockDio = MockDio();
      when(() => mockDio.options).thenReturn(BaseOptions());
      currencyWebService = CurrencyWebService(mockDio);
    });

    test(
      'should return CountriesResponseModel when API call is successful',
      () async {
        // Arrange
        final responseData = TestData.countriesApiResponseJson;
        final response = Response(
          data: responseData,
          statusCode: 200,
          requestOptions: RequestOptions(path: EndPoints.countries),
        );

        when(
          () => mockDio.fetch<Map<String, dynamic>>(any<RequestOptions>()),
        ).thenAnswer((_) async => response);

        // Act
        final result = await currencyWebService.getCountries(
          apiKey: TestData.testApiKey,
        );

        // Assert
        expect(result.results.length, equals(4));
        expect(result.results.containsKey('US'), isTrue);

        verify(
          () => mockDio.fetch<Map<String, dynamic>>(any<RequestOptions>()),
        ).called(1);
      },
    );
  });
}
