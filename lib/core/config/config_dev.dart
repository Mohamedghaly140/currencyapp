import 'package:currencyapp/core/config/app_config.dart';
import 'package:currencyapp/core/config/env_dev.dart';

class DevelopmentAppConfig {
  static Future<void> setup() async {
    AppConfig.apiUrl = 'https://prepaid.currconv.com';
    AppConfig.apiKey = EnvDev.apiKey;
  }
}
