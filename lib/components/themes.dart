import 'package:flutter/material.dart';

ThemeData lightTheme(String fontFamily) {
  return ThemeData(
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(backgroundColor: Color(0xFFF5F5F5)),
    appBarTheme: const AppBarTheme(backgroundColor: Color(0xFFF5F5F5)),
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),
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
    appBarTheme: const AppBarTheme(backgroundColor: const Color(0xFF212121)),
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(backgroundColor: Color(0xFF212121)),
    scaffoldBackgroundColor: const Color(0xFF212121),
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
