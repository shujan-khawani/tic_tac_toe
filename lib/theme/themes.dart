import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Light Mode
ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  textTheme: GoogleFonts.pressStart2pTextTheme(
    ThemeData.light().textTheme,
  ),
  colorScheme: const ColorScheme.light(
    background: Color(0xFFEEEEEE),
    primary: Color(0xFF212121),
    secondary: Colors.orange,
  ),
);

// Dark Mode
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  textTheme: GoogleFonts.pressStart2pTextTheme(
    ThemeData.dark().textTheme,
  ),
  colorScheme: const ColorScheme.dark(
    background: Color(0xFF212121),
    primary: Color(0xFFEEEEEE),
    secondary: Colors.orange,
  ),
);
