import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class CacheHelper {
  final SharedPreferences _prefs;

  CacheHelper(this._prefs);
  Future<void> set({required String key, required String value}) async {
    await _prefs.setString(key, value);
  }

  String? get({required String key}) {
    return _prefs.getString(key);
  }

  bool? getBool({required String key}) {
    return _prefs.getBool(key);
  }

  Future<void> setBool({required String key, required bool value}) async {
    await _prefs.setBool(key, value);
  }

  //remove key
  Future<void> remove({required String key}) async {
    await _prefs.remove(key);
  }

  //delete all keys
  Future<void> deleteAllKeys() async {
    await _prefs.clear();
  }

  Future<void> deleteSecureData(String key) async {
    await _prefs.remove(key);
  }
}
