import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color groveCream = Color(0xFFFFEBC0);
  static const Color groveEspresso = Color(0xFF412513);
  static const Color groveHoney = Color(0xFFFEDB7D);
  static const Color groveHoneyDark = Color(0xFFE6B82E);
  static const Color groveCreamLight = Color(0xFFFFF5D9);
}

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.groveCream,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.groveHoney,
        primary: AppColors.groveHoney,
        secondary: AppColors.groveEspresso,
        surface: AppColors.groveCream,
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.playfairDisplay(
          fontSize: 84,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          color: AppColors.groveEspresso,
        ),
        displayMedium: GoogleFonts.playfairDisplay(
          fontSize: 64,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          color: AppColors.groveEspresso,
        ),
        displaySmall: GoogleFonts.playfairDisplay(
          fontSize: 48,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          color: AppColors.groveEspresso,
        ),
        headlineLarge: GoogleFonts.josefinSans(
          fontSize: 48,
          fontWeight: FontWeight.bold,
          color: AppColors.groveEspresso,
        ),
        headlineMedium: GoogleFonts.josefinSans(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: AppColors.groveEspresso,
        ),
        titleLarge: GoogleFonts.josefinSans(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: AppColors.groveEspresso,
        ),
        bodyLarge: GoogleFonts.ibarraRealNova(
          fontSize: 20,
          color: AppColors.groveEspresso,
          height: 1.5,
        ),
        bodyMedium: GoogleFonts.ibarraRealNova(
          fontSize: 16,
          color: AppColors.groveEspresso,
          height: 1.5,
        ),
        labelLarge: GoogleFonts.josefinSans(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          letterSpacing: 2.0,
          color: AppColors.groveEspresso,
        ),
      ),
    );
  }
}
