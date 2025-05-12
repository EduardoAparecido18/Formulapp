import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.grey,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.grey.shade400,
      selectedItemColor: Colors.grey.shade200,
      unselectedItemColor: Colors.grey.shade300,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey.shade500,
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black))),
    textTheme: const TextTheme(
        bodyLarge: TextStyle(
            color: Colors.black, fontSize: 18, fontFamily: "Formula1"),
        bodyMedium: TextStyle(
            color: Colors.black, fontSize: 15, fontFamily: "Formula1")),
    colorScheme: ColorScheme.light(
      surface: Colors.white,
      primary: Colors.grey.shade200,
      secondary: Colors.grey.shade300,
      tertiary: Colors.grey.shade400,
    ));

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.grey.shade900,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey.shade900,
      foregroundColor: Colors.white,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.grey.shade800,
        selectedItemColor: Colors.grey.shade300,
        unselectedItemColor: Colors.grey.shade500),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey.shade800,
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.white))),
    textTheme: const TextTheme(
        bodyLarge: TextStyle(
            color: Colors.white, fontSize: 18, fontFamily: "Formula1"),
        bodyMedium: TextStyle(
            color: Colors.white, fontSize: 15, fontFamily: "Formula1")),
    colorScheme: ColorScheme.dark(
      surface: Colors.grey.shade900,
      primary: Colors.grey.shade800,
      secondary: Colors.grey.shade700,
      tertiary: Colors.grey.shade600,
    ));
