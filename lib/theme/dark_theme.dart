import 'package:flutter/material.dart';
import 'package:dietitian/utils/colors.dart';

ThemeData dark = ThemeData(
  fontFamily: 'Roboto',
  // primaryColor: Color(0xFF689da7),
  brightness: Brightness.dark,
  primaryColor: ColorResources.darkBackgroundColor,
  secondaryHeaderColor: Color(0xFFaaa818),
  scaffoldBackgroundColor: ColorResources.darkBackgroundColor,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorResources.whiteColor,
      selectedItemColor: ColorResources.themeDarkBackgroundColor),
);
