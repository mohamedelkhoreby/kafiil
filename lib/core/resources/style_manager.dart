import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: FontConstants.montserrat,
      color: color,
      fontWeight: fontWeight);
}

TextStyle lightMontserratStyle(
    {required double fontSize, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color);
}

TextStyle regularMontserratStyle(
    {required double fontSize, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}

TextStyle mediumMontserratStyle(
    {required double fontSize, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}

TextStyle blodMontserratStyle(
    {required double fontSize, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color);
}

TextStyle semiBlodMontserrat({required double fontSize, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color);
}
