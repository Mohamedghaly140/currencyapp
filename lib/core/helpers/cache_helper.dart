import 'package:shared_preferences/shared_preferences.dart';
import 'package:currencyapp/core/dependency_injection/get_it_instance.dart';

class SecureStorage {
  Future<void> set({required String key, required String value}) async {
    final prefs = sl<SharedPreferences>();
    await prefs.setString(key, value);
  }

  String? get({required String key}) {
    final prefs = sl<SharedPreferences>();
    return prefs.getString(key);
  }

  bool? getBool({required String key}) {
    final prefs = sl<SharedPreferences>();
    return prefs.getBool(key);
  }

  Future<void> setBool({required String key, required bool value}) async {
    final prefs = sl<SharedPreferences>();
    await prefs.setBool(key, value);
  }

  //remove key
  Future<void> remove({required String key}) async {
    final prefs = sl<SharedPreferences>();
    await prefs.remove(key);
  }

  //delete all keys
  Future<void> deleteAllKeys() async {
    final prefs = sl<SharedPreferences>();
    await prefs.clear();
  }

  Future<void> deleteSecureData(String key) async {
    final prefs = sl<SharedPreferences>();
    await prefs.remove(key);
  }
}
