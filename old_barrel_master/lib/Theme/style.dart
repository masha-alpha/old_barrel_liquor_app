import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  fontFamily: 'Poppins',
  scaffoldBackgroundColor: Color(0xff141517),
  primaryColor: Color(0xffc8a37c),
  secondaryHeaderColor: Color(0xff232428),
//subtitle color - 81807f
//   https://fonts.google.com/specimen/Poppins
  backgroundColor: Colors.white,
  hintColor: Colors.grey[400],
  // dividerColor: hintColor,
  cardColor: Color(0xff202020),

  ///appBar theme
  appBarTheme: AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Color(0xffc8a37c),
      ),
      textTheme: TextTheme(
          headline6: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500))),

  ///text theme
  textTheme: TextTheme(
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
          headline6: TextStyle(),
          headline5: TextStyle(),
          caption: TextStyle(color: Colors.grey[400]),
          // subtitle1: TextStyle(),
          // subtitle2: TextStyle(),
          button: TextStyle(letterSpacing: 1.5, fontSize: 16))
      .apply(bodyColor: Colors.white),
);

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
