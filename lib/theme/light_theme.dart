import 'package:flutter/material.dart';
import 'package:dietitian/utils/colors.dart';

ThemeData light = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'Montserrat',
  primaryColor: ColorResources.whiteColor,
  // backgroundColor: Colors.white,
  // primaryColorDark: Colors.black,
  // textTheme: const TextTheme(
  //   titleLarge: TextStyle(color: Color(0xFF003E47)),
  //   titleSmall: TextStyle(color: Color(0xFF25282D)),
  // ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: ColorResources.themeLightBackgroundColor),
);
