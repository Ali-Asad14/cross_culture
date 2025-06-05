import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData appTheme = ThemeData(
  // App-wide background and base colors
  scaffoldBackgroundColor: const Color(0xFFF2EFE9),
  primaryColor: const Color(0xFF0C5C4C),
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF0C5C4C),
    primary: const Color(0xFF0C5C4C),
    secondary: const Color(0xFFF2B705),
    surface: const Color(0xFFE3D5C0),
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onSurface: Colors.black87,
  ),

  // AppBar styling
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF0C5C4C),
    foregroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),

  // Headline & body text styles
  textTheme: GoogleFonts.poppinsTextTheme().copyWith(
    displayLarge: const TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Color(0xFF0C5C4C),
    ),
    headlineMedium: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Color(0xFF0C5C4C),
    ),
    bodyLarge: const TextStyle(fontSize: 18, color: Colors.black87),
    bodyMedium: const TextStyle(fontSize: 16, color: Colors.black87),
    labelLarge: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  ),

  // Elevated buttons
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFFF2B705),
      foregroundColor: Colors.black,
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      elevation: 2,
    ),
  ),

  // Text buttons
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: const Color(0xFF0C5C4C),
      textStyle: const TextStyle(fontWeight: FontWeight.w600),
    ),
  ),

  // Input fields
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFFFDFBF6),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Color(0xFF0C5C4C), width: 1.5),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Color(0xFF0C5C4C), width: 2),
    ),
    hintStyle: const TextStyle(color: Colors.grey),
    labelStyle: const TextStyle(color: Color(0xFF0C5C4C)),
  ),

  // Card components
  cardTheme: CardThemeData(
    color: const Color(0xFFE3D5C0),
    elevation: 2,
    margin: const EdgeInsets.all(12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
  ),

  // Divider and icon theme
  dividerColor: const Color(0xFFB4A181),
  iconTheme: const IconThemeData(color: Color(0xFF0C5C4C)),

  // Tooltip styling (if used for cultural hints)
  tooltipTheme: const TooltipThemeData(
    decoration: BoxDecoration(
      color: Color(0xFF0C5C4C),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    textStyle: TextStyle(color: Colors.white),
  ),
);
