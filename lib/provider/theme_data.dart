// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyTheme {
  static final lightTheme = ThemeData(
    colorScheme: ColorScheme.light(),
    primaryColor: Colors.grey[200],
    appBarTheme: AppBarTheme(
        backgroundColor: Color.fromARGB(0, 255, 255, 255),
        foregroundColor: Colors.black),
  );

  static final darkTheme = ThemeData(
    primaryColor: Colors.grey[700],
    appBarTheme: AppBarTheme(
        backgroundColor: Color.fromARGB(0, 0, 0, 0),
        foregroundColor: Colors.white),
      colorScheme: ColorScheme.dark());
}
