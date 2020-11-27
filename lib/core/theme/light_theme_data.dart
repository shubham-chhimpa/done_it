import 'package:flutter/material.dart';

final Color _primaryColor = Colors.yellow[700];
final Color _appBarColor = Colors.grey[100];
final Color _appBarIconColor = Colors.black87;
final Color _foreGroundColor = Colors.white;

var lightThemeData = ThemeData(
  cursorColor: _primaryColor,
  textSelectionColor: _primaryColor,
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.grey[200],
  primaryColor: _primaryColor,
  indicatorColor: _primaryColor,
  accentColor: _primaryColor,
  buttonColor: _primaryColor,
  iconTheme: IconThemeData(color: _primaryColor),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  appBarTheme: AppBarTheme(
    color: _appBarColor,
    iconTheme: IconThemeData(
      color: _appBarIconColor,
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: _primaryColor,
      foregroundColor: _foreGroundColor
  ),
);
