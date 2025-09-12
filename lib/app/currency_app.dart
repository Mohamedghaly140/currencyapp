import 'dart:math';

import 'package:flutter/material.dart';

import 'package:scaled_app/scaled_app.dart';
import 'package:toastification/toastification.dart';
import 'package:currencyapp/core/config/app_configuration.dart';

class CurrencyApp extends StatelessWidget {
  const CurrencyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      config: AppConfiguration.toastConfig,
      child: MaterialApp(
        title: AppConfiguration.appTitle,
        debugShowCheckedModeBanner: false,
        scaffoldMessengerKey: AppConfiguration.scaffoldMessengerKey,
        home: Scaffold(
          appBar: AppBar(title: Text(AppConfiguration.appTitle)),
          body: Center(child: Text('Currency App')),
        ),
        builder: _buildScaledApp,
      ),
    );
  }

  Widget _buildScaledApp(BuildContext context, Widget? child) {
    return MediaQuery(
      data: MediaQuery.of(context).scale().copyWith(
        textScaler: const TextScaler.linear(1.0),
        size: Size(
          min(600, MediaQuery.of(context).size.width),
          MediaQuery.of(context).size.height,
        ),
      ),
      child: child ?? const SizedBox.shrink(),
    );
  }
}
