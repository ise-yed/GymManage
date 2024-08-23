import 'package:flutter/material.dart';

OutlineInputBorder _buildBorder(Color color) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: color),
    borderRadius: BorderRadius.circular(8.0),
  );
}

ThemeData lightTheme(String fontFamily) {
  return ThemeData(
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(14),
      filled: true,
      fillColor: const Color(0xFFF5F5F5),
      border: _buildBorder(Colors.grey),
      enabledBorder: _buildBorder(Colors.grey),
      focusedBorder: _buildBorder(Colors.blue),
      errorBorder: _buildBorder(Colors.red),
      focusedErrorBorder: _buildBorder(Colors.redAccent),
    ),
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(backgroundColor: Color(0xFFF5F5F5)),
    appBarTheme: const AppBarTheme(backgroundColor: Color(0xFFF5F5F5)),
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),
    colorScheme: ColorScheme.light(
        primary: Colors.black,
        onPrimary: Colors.white,
        secondary: Colors.blueAccent.shade700,
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
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(14),
      filled: true,
      fillColor: const Color(0xFF212121),
      border: _buildBorder(Colors.grey),
      enabledBorder: _buildBorder(Colors.grey),
      focusedBorder: _buildBorder(Colors.blue),
      errorBorder: _buildBorder(Colors.red),
      focusedErrorBorder: _buildBorder(Colors.redAccent),
    ),
    appBarTheme: const AppBarTheme(backgroundColor: const Color(0xFF212121)),
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(backgroundColor: Color(0xFF212121)),
    scaffoldBackgroundColor: const Color(0xFF212121),
    colorScheme: ColorScheme.dark(
        primary: Colors.white,
        onPrimary: Colors.black,
        secondary: Colors.blueAccent.shade700,
        onSecondary: Colors.white),
    fontFamily: fontFamily,
    textTheme: const TextTheme(
        bodyLarge:
            TextStyle(fontFamily: 'dana', color: Colors.white, fontSize: 16),
        bodyMedium:
            TextStyle(fontFamily: 'dana', color: Colors.white, fontSize: 14)),
  );
}
