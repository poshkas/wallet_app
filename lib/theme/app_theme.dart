import 'package:flutter/material.dart';

class AppTheme {
  // Colors
  static const Color primaryColor = Color(0xFF00BFFF); // #00BFFF (cyan blue)
  static const Color backgroundColor = Color(0xFF10161F);
  static const Color cardColor = Color(0xFF1A2332);
  static const Color foregroundColor = Color(0xFFCCD6DD);
  static const Color mutedForegroundColor = Color(0xFF8899A6);
  static const Color borderColor = Color(0xFF38444D);
  static const Color destructiveColor = Color(0xFFE0245E);
  static const Color greenColor = Color(0xFF00D9A5);
  static const Color redColor = Color(0xFFE0245E);

  // Dark Theme
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: backgroundColor,
      colorScheme: const ColorScheme.dark(
        primary: primaryColor,
        secondary: cardColor,
        surface: cardColor,
        error: destructiveColor,
        onPrimary: Colors.white,
        onSecondary: foregroundColor,
        onSurface: foregroundColor,
        onError: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: foregroundColor),
        titleTextStyle: TextStyle(
          color: foregroundColor,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      cardTheme: CardThemeData(
        color: cardColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: borderColor, width: 1),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: cardColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: primaryColor, width: 2),
        ),
        hintStyle: const TextStyle(color: mutedForegroundColor),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: foregroundColor,
          side: const BorderSide(color: borderColor, width: 1),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.white;
          }
          return mutedForegroundColor;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return primaryColor;
          }
          return borderColor;
        }),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: cardColor,
        selectedColor: primaryColor.withOpacity(0.2),
        disabledColor: cardColor,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        labelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: foregroundColor,
        ),
        secondaryLabelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: primaryColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: borderColor, width: 1),
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: foregroundColor,
          fontSize: 36,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: TextStyle(
          color: foregroundColor,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: TextStyle(
          color: foregroundColor,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
        headlineMedium: TextStyle(
          color: foregroundColor,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        titleLarge: TextStyle(
          color: foregroundColor,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: foregroundColor,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(
          color: foregroundColor,
          fontSize: 16,
        ),
        bodyMedium: TextStyle(
          color: foregroundColor,
          fontSize: 14,
        ),
        bodySmall: TextStyle(
          color: mutedForegroundColor,
          fontSize: 12,
        ),
      ),
    );
  }

  // Mobile container max width
  static const double mobileMaxWidth = 375.0;
}
