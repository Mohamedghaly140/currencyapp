import 'package:flutter/material.dart';
import 'package:currencyapp/core/resources/app_strings.dart';
import 'package:currencyapp/core/resources/font_manager.dart';
import 'package:toastification/toastification.dart';

class AppConfiguration {
  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static ToastificationConfig get toastConfig =>
      ToastificationConfig(maxToastLimit: 1);

  static String get appTitle => AppStrings.appName;

  static String get defaultFontFamily => FontConstants.mainFont;
}
