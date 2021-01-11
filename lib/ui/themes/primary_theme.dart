import 'package:flutter/material.dart';

final primaryColor = Color.fromRGBO(255, 255, 255, 1);
final primaryColorHover = Color.fromRGBO(128, 80, 209, 1);
final primaryColorDark = Color.fromRGBO(255, 255, 255, 1);
final primaryColorLight = Color.fromRGBO(188, 71, 123, 1);

final ThemeData primaryThemeData = ThemeData(
  primaryColor: primaryColor,
  brightness: Brightness.light,
  accentColor: Colors.green[600],
  appBarTheme: AppBarTheme(color: primaryColor),
  textTheme: TextTheme(
    headline1: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white,
      ),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white,
      ),
    ),
    alignLabelWithHint: true,
    labelStyle: TextStyle(
      color: Colors.white,
      fontSize: 14.0,
    ),
  ),
  buttonTheme: ButtonThemeData(
    colorScheme: ColorScheme.light(
      primary: primaryColor,
    ),
    buttonColor: primaryColor,
    splashColor: primaryColorHover,
    padding: EdgeInsets.symmetric(
      vertical: 16,
      horizontal: 20,
    ),
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  ),
);
