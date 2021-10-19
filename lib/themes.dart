import 'package:flutter/material.dart';

class MyThemes {
  static final primaryColor = Color(0xff409F78);

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColorDark: primaryColor,
    colorScheme: ColorScheme.dark(primary: primaryColor),
    dividerColor: Colors.white,
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey[200],
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: primaryColor,
    colorScheme: ColorScheme.light(primary: primaryColor),
    iconTheme: IconThemeData(
      color: primaryColor,
      size: 22,
    ),
    textTheme: ThemeData.light().textTheme.copyWith(
          // for main text color of widgets
          bodyText1: TextStyle(
            color: Color(0xff35433E),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          // for second text color of widgets

          bodyText2: TextStyle(
            color: Colors.grey,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          headline3: TextStyle(
            color: Color(0xff409F78),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          // for appbar
          headline1: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
  );
}
