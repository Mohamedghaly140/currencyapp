import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontFamily: FontConstants.mainFont,
  );
}

abstract class AppTextStyle {
  static TextStyle getLightStyle({
    double? fontSize,
    Color color = Colors.black,
  }) {
    return _getTextStyle(
      fontSize ?? FontSize.s12,
      FontWeightManager.light,
      color,
    );
  }

  static TextStyle getRegularStyle({
    double? fontSize,
    Color color = Colors.black,
  }) {
    return _getTextStyle(
      fontSize ?? FontSize.s12,
      FontWeightManager.regular,
      color,
    );
  }

  static TextStyle getMediumStyle({
    double? fontSize,
    Color color = Colors.black,
  }) {
    return _getTextStyle(
      fontSize ?? FontSize.s12,
      FontWeightManager.medium,
      color,
    );
  }

  static TextStyle getSemiBoldStyle({
    double? fontSize,
    Color color = Colors.black,
  }) {
    return _getTextStyle(
      fontSize ?? FontSize.s12,
      FontWeightManager.semiBold,
      color,
    );
  }

  static TextStyle getBoldStyle({
    double? fontSize,
    Color color = Colors.black,
  }) {
    return _getTextStyle(
      fontSize ?? FontSize.s12,
      FontWeightManager.bold,
      color,
    );
  }
}
