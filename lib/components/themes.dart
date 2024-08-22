import 'package:flutter/material.dart';

ThemeData lightTheme(String fontFamily) {
  return ThemeData(
    scaffoldBackgroundColor: Colors.green,
    colorScheme: ColorScheme.light(
        primary: Colors.black,
        onPrimary: Colors.white,
        secondary: Colors.blue.shade800,
        onSecondary: Colors.white),
    fontFamily: fontFamily,
    textTheme: const TextTheme(
        bodyLarge:
            TextStyle(fontFamily: 'dana', color: Colors.black, fontSize: 16),
        bodyMedium:
            TextStyle(fontFamily: 'dana', color: Colors.black, fontSize: 14)),
  );
}

ThemeData darkTheme(String fontFamily) {
  return ThemeData(
    scaffoldBackgroundColor: Colors.red,
    colorScheme: ColorScheme.dark(
        primary: Colors.white,
        onPrimary: Colors.black,
        secondary: Colors.blue.shade800,
        onSecondary: Colors.white),
    fontFamily: fontFamily,
    textTheme: const TextTheme(
        bodyLarge:
            TextStyle(fontFamily: 'dana', color: Colors.white, fontSize: 16),
        bodyMedium:
            TextStyle(fontFamily: 'dana', color: Colors.white, fontSize: 14)),
  );
}
