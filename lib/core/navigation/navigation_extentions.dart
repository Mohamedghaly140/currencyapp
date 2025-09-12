import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

extension FlowNav on BuildContext {
  /// Pops (n-1) routes, then replaces the current with [location].
  void replaceLastNWith(String location, {int n = 1, Object? extra}) {
    for (var i = 1; i < n; i++) {
      if (!canPop()) break;
      pop();
    }
    replace(location, extra: extra);
  }


}