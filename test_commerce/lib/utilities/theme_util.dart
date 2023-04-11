import 'package:flutter/material.dart';

import 'color_utils.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(elevation: 2),
    primaryColor: AppColors.blueOcean,
    primarySwatch: const MaterialColor(0XFF3669C9, customSwatch),
    scaffoldBackgroundColor: AppColors.pureWhite,
  );
}

const Map<int, Color> customSwatch = {
  50: Color.fromRGBO(54, 105, 201, .1),
  100: Color.fromRGBO(54, 105, 201, .2),
  200: Color.fromRGBO(54, 105, 201, .3),
  300: Color.fromRGBO(54, 105, 201, .4),
  400: Color.fromRGBO(54, 105, 201, .5),
  500: Color.fromRGBO(54, 105, 201, .6),
  600: Color.fromRGBO(54, 105, 201, .7),
  700: Color.fromRGBO(54, 105, 201, .8),
  800: Color.fromRGBO(54, 105, 201, .9),
  900: Color.fromRGBO(54, 105, 201, 1),
};
