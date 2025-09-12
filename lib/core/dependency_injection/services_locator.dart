import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:currencyapp/core/dependency_injection/get_it_instance.dart';
import 'package:currencyapp/core/helpers/cache_helper.dart';
import 'package:currencyapp/core/networking/dio_factory.dart';

abstract class ServicesLocator {
  static Future<void> init() async {
    // Shared Preferences
    final prefs = await SharedPreferences.getInstance();
    sl.registerLazySingleton<SharedPreferences>(() => prefs);

    // Secure Storage
    sl.registerLazySingleton<SecureStorage>(() => SecureStorage());

    // Dio
    sl.registerLazySingleton<Dio>(() => DioFactory.getDio());

    // injection
    await Future.wait([]);
  }
}
