import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.grey.shade500,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey.shade500,
      foregroundColor: Colors.black,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.grey.shade400,
      selectedItemColor: Colors.grey.shade100,
      unselectedItemColor: Colors.grey.shade200,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey.shade300,
            foregroundColor: Colors.grey.shade200,
            textStyle:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 15))),
    colorScheme: ColorScheme.light(
      surface: Colors.grey.shade200,
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
            backgroundColor: Colors.grey.shade800,
            foregroundColor: Colors.grey.shade600,
            textStyle:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 15))),
    colorScheme: ColorScheme.dark(
      surface: Colors.grey.shade600,
      primary: Colors.grey.shade800,
      secondary: Colors.grey.shade700,
      tertiary: Colors.grey.shade600,
    ));
