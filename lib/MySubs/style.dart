import 'package:flutter/material.dart';

import 'colors.dart';

final ThemeData appTheme = ThemeData(
  fontFamily: 'Poppins',
  scaffoldBackgroundColor: scaffoldBg,
  unselectedWidgetColor: greyColor,
  appBarTheme: AppBarTheme(
    color: Colors.transparent,
    elevation: 0.0,
  ),

  //text theme
  textTheme: TextTheme(
    //default text style of Text Widget
    bodyLarge: TextStyle(color: whiteColor, fontSize: 15),
    bodyMedium: TextStyle(color: Colors.white, fontSize: 15),
    titleMedium: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
    displaySmall:
        TextStyle(color: whiteColor, fontWeight: FontWeight.bold, fontSize: 14),
    headlineSmall:
        TextStyle(color: whiteColor, fontWeight: FontWeight.bold, fontSize: 14),
    titleLarge:
        TextStyle(color: whiteColor, fontWeight: FontWeight.bold, fontSize: 14),
    bodySmall:
        TextStyle(color: whiteColor, fontWeight: FontWeight.bold, fontSize: 14),
    labelSmall: TextStyle(),
  ), //colorScheme: ColorScheme(background: scaffoldBg) /*.apply(displayColor: Colors.black)*/,
);
//);

/// NAME         SIZE  WEIGHT  SPACING
/// headline1    96.0  light   -1.5
/// headline2    60.0  light   -0.5
/// headline3    48.0  regular  0.0
/// headline4    34.0  regular  0.25
/// headline5    24.0  regular  0.0
/// headline6    20.0  medium   0.15
/// subtitle1    16.0  regular  0.15
/// subtitle2    14.0  medium   0.1
/// body1        16.0  regular  0.5   (bodyText1)
/// body2        14.0  regular  0.25  (bodyText2)
/// button       14.0  medium   1.25
/// caption      12.0  regular  0.4
/// overline     10.0  regular  1.5
