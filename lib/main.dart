import 'package:currencyapp/app/currency_app.dart';
import 'package:currencyapp/app/minimal_app.dart';
import 'package:currencyapp/core/config/config_dev.dart';
import 'package:currencyapp/core/dependency_injection/services_locator.dart';
import 'package:currencyapp/core/helpers/debug_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:scaled_app/scaled_app.dart';

Future<void> main() async {
  try {
    ScaledWidgetsFlutterBinding.ensureInitialized(
      scaleFactor: (deviceSize) {
        if (deviceSize.width > 600) {
          return 1.0;
        }
        const double widthOfDesign = 375;
        return deviceSize.width / widthOfDesign;
      },
    );

    // Setup App Config
    await DevelopmentAppConfig.setup();

    // Setup Services Locator
    try {
      await ServicesLocator.init();
    } catch (e) {
      DebugHelper.log('Failed to initialize Services Locator: $e');
    }

    // Setup Hydrated Bloc
    try {
      HydratedBloc.storage = await HydratedStorage.build(
        storageDirectory: HydratedStorageDirectory(
          (await getTemporaryDirectory()).path,
        ),
      );
    } catch (e) {
      DebugHelper.log('Failed to initialize Hydrated Bloc: $e');
    }

    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    runApp(const CurrencyApp());
  } catch (e) {
    DebugHelper.log('Error: $e');
    runApp(const MinimalApp());
  }
}
