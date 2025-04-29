import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.grey.shade400,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey.shade400,
      foregroundColor: Colors.black,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.grey.shade500,
      selectedItemColor: Colors.grey.shade100,
      unselectedItemColor: Colors.grey.shade300,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
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
      surface: Colors.grey.shade400,
      primary: Colors.grey.shade400,
      secondary: Colors.grey.shade300,
      tertiary: Colors.grey.shade200,
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
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
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
