import 'package:flutter/material.dart';

double baseScreenWidth = 375;
double baseFontSize = 16;

class AppDimensions {
  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static EdgeInsetsGeometry screenPadding(BuildContext context) =>
      EdgeInsets.symmetric(
          vertical: height(context) * 0.015, horizontal: width(context) * 0.04);

  static horizontalPadding(BuildContext context) =>
      EdgeInsets.symmetric(horizontal: width(context) * 0.04);

  static double calculateTextSize(BuildContext context, double fontSize) {
    final scaleFactor = width(context) / baseScreenWidth;
    final calculatedFontSize = fontSize * scaleFactor;
    return calculatedFontSize;
  }

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 480;
}
