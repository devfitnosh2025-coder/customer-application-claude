import 'package:flutter/material.dart';

class AppTheme {
  // Brand
  static const Color primaryColor = Color(0xFF5DB075);
  static const Color primaryHover = Color(0xFF4A9962);
  static const Color emeraldColor = Color(0xFF10B981);
  static const Color emeraldLight = Color(0xFFD1FAE5);
  static const Color emeraldText = Color(0xFF166534);
  static const Color cyanColor = Color(0xFF06B6D4);
  static const Color cyanBgTint = Color(0xFFE0F7FA);

  // Customer App — Hero gradient
  static const Color heroGradientStart = Color(0xFFC8F05A);
  static const Color heroGradientMid = Color(0xFF8BC34A);
  static const Color heroGradientEnd = Color(0xFF5DB075);

  // Customer App — Content surfaces
  static const Color contentBackground = Color(0xFFF5F0E8);
  static const Color contentCard = Color(0xFFFFFFFF);
  static const Color contentCardBorder = Color(0xFFE8E0D4);
  static const Color contentDivider = Color(0xFFEDE8DF);

  // Customer App — Text
  static const Color caTextPrimary = Color(0xFF1A2A1A);
  static const Color caTextSecondary = Color(0xFF5C6B5C);
  static const Color caTextMuted = Color(0xFF8C9E8C);
  static const Color caTextOnHero = Color(0xFF1A3A1A);
  static const Color caTextWarmGray = Color(0xFF6B6054);

  // Customer App — Macro accents
  static const Color macroCarbs = Color(0xFF8BA9E0);
  static const Color macroProtein = Color(0xFFE08080);
  static const Color macroFat = Color(0xFFE0C860);

  // Ring
  static const Color ringProgress = Color(0xFF2D6A2D);

  // Neutral / general
  static const Color secondaryColor = Color(0xFFFFFFFF);
  static const Color titleColor = Color(0xFF1A2A1A);
  static const Color subTitleColor = Color(0xFF5C6B5C);
  static const Color darkBackgroundColor = Color(0xFF0F1A0F);
  static const Color darkSurfaceColor = Color(0xFF1A2E1A);
  static const Color darkBorderColor = Color(0xFF2A4A2A);
  static const Color transparentColor = Colors.transparent;

  // Semantic
  static const Color errorColor = Color(0xFFE08080);

  static const String fontFamily = 'PlusJakartaSans';

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: contentBackground,
    fontFamily: fontFamily,
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      onPrimary: secondaryColor,
      surface: contentCard,
      onSurface: caTextPrimary,
      error: errorColor,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: caTextPrimary),
      headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: caTextPrimary),
      bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: caTextPrimary),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: caTextSecondary),
      bodySmall: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: caTextSecondary),
      labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: secondaryColor),
      labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: caTextSecondary),
      labelSmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: caTextSecondary),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: contentBackground,
      elevation: 0,
      titleTextStyle: TextStyle(fontFamily: fontFamily, fontSize: 18, fontWeight: FontWeight.w600, color: caTextPrimary),
      iconTheme: IconThemeData(color: caTextPrimary),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith((s) =>
            s.contains(WidgetState.disabled) ? primaryColor.withValues(alpha: 0.5) : primaryColor),
        foregroundColor: WidgetStateProperty.all(secondaryColor),
        textStyle: WidgetStateProperty.all(
          const TextStyle(fontFamily: fontFamily, fontSize: 16, fontWeight: FontWeight.w600),
        ),
        minimumSize: WidgetStateProperty.all(const Size(double.infinity, 52)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(99)),
        ),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: darkBackgroundColor,
    fontFamily: fontFamily,
    colorScheme: const ColorScheme.dark(
      primary: primaryColor,
      onPrimary: secondaryColor,
      surface: darkSurfaceColor,
      onSurface: secondaryColor,
      error: errorColor,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith((s) =>
            s.contains(WidgetState.disabled) ? primaryColor.withValues(alpha: 0.5) : primaryColor),
        foregroundColor: WidgetStateProperty.all(secondaryColor),
        textStyle: WidgetStateProperty.all(
          const TextStyle(fontFamily: fontFamily, fontSize: 16, fontWeight: FontWeight.w600),
        ),
        minimumSize: WidgetStateProperty.all(const Size(double.infinity, 52)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(99)),
        ),
      ),
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: secondaryColor),
      headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: secondaryColor),
      bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: secondaryColor),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: secondaryColor),
      bodySmall: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: secondaryColor),
      labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: secondaryColor),
      labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: secondaryColor),
      labelSmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: secondaryColor),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: darkBackgroundColor,
      elevation: 0,
      titleTextStyle: TextStyle(fontFamily: fontFamily, fontSize: 18, fontWeight: FontWeight.w600, color: secondaryColor),
      iconTheme: IconThemeData(color: secondaryColor),
    ),
  );
}
