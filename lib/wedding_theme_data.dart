import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeddingThemeData {
  static const _fillColor = Color(0xffffffff);

  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);

  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: TextTheme().apply(
          displayColor: Color(0xff343434),
          fontFamily: GoogleFonts.roboto().fontFamily),
      primaryColor: colorScheme.primary,
      appBarTheme: AppBarTheme(
        color: colorScheme.background,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.primary),
        brightness: colorScheme.brightness,
      ),
      iconTheme: IconThemeData(
        color: colorScheme.onPrimary,
      ),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      accentColor: colorScheme.primary,
      focusColor: focusColor,
    );
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: Color(0xff00ADB5),
    primaryVariant: Colors.tealAccent,
    secondary: Colors.teal,
    secondaryVariant: Colors.tealAccent,
    surface: _fillColor,
    background: _fillColor,
    error: Color(0xFFCD0F0F),
    onPrimary: _fillColor,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF414141),
    onBackground: _fillColor,
    onError: _fillColor,
    brightness: Brightness.light,
  );
}
