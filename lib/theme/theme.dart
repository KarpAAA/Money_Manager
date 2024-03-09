import 'package:flutter/material.dart';

final lightTheme = ThemeData(
    textTheme:  const TextTheme(
      bodySmall: TextStyle(
          fontSize: 15.0,
          color: Colors.grey,
          fontFamily: "OpenSans"),
      bodyMedium: TextStyle(
          fontSize: 20.0,
          fontFamily: "OpenSans"),
      bodyLarge: TextStyle(
          fontSize: 52.0,
          fontFamily: "OpenSans"),

      labelLarge: TextStyle(
          fontSize: 16.0,
          fontFamily: "OpenSans"),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
    ));
