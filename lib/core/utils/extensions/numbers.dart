import 'dart:math';

extension NumberExtension on num {
  double truncateToDecimals(int decimals) {
    num fac = pow(10, decimals);
    return (this * fac).truncateToDouble() / fac;
  }
}
