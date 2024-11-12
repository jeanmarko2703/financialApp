import 'package:flutter/material.dart';

class AppTheme {
  static Color mainColor = Colors.black;

  static ThemeData defaultTheme = ThemeData.dark().copyWith(
      scaffoldBackgroundColor: mainColor,
      appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.black.withOpacity(0.7),
        filled: true,
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ));
}
