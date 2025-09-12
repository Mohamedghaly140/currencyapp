import 'package:currencyapp/core/helpers/debug_helper.dart';
import 'package:flutter/material.dart';

class AppNavigationObserver extends RouteObserver<ModalRoute<dynamic>> {
  //log every route
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    //log from to
    DebugHelper.log(
      'Route: ${previousRoute?.settings.name} -> ${route.settings.name}',
    );
  }
}
