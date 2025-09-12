import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';

abstract class DebugHelper {
  static void log(
    String message, {
    dynamic error,
    StackTrace? stackTrace,
    String? name,
  }) {
    if (kDebugMode) {
      developer.log(
        message,
        error: error,
        stackTrace: stackTrace,
        name: name ?? 'DebugHelper',
      );
    }
  }

  static void printOnlyInDebug(String message) {
    if (kDebugMode) {
      print(message);
    }
  }
}
