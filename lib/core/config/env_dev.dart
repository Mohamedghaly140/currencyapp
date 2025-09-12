import 'package:envied/envied.dart';

part 'env_dev.g.dart';

@Envied(path: '.env.dev', obfuscate: true)
final class EnvDev {
  @EnviedField(varName: 'API_KEY', obfuscate: true)
  static final String apiKey = _EnvDev.apiKey;
}
