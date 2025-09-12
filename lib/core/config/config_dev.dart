import 'package:currencyapp/core/config/app_config.dart';

class DevelopmentAppConfig {
  static Future<void> setup() async {
    AppConfig.apiUrl = 'https://development.currencyapp.click';
  }
}
