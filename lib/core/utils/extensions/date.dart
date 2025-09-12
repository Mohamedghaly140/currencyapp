import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String toYYYYMMDD() {
    final formatter = DateFormat('yyyy-mm-dd');
    return formatter.format(this);
  }
}
