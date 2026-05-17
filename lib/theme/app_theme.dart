import 'package:flutter/material.dart';

// AUTO-GENERATED — DO NOT EDIT MANUALLY
// Source: tokens.json (Figma file: WP1rgKnAzi23pGRGvcBQqG)
// Generated: 2026-05-17
// To regenerate: python3 tools/tokens_to_dart.py

class AppColors {
  // Frame 1 background
  static const Color background = Color(0xFFFFFFFF);
  // Rectangle 2 (header bar)
  static const Color header = Color(0xFF0AFF0A);
  // Rectangle 1/デフォルト
  static const Color cardDefault = Color(0xFFD9D9D9);
  // Rectangle 1/バリアント2
  static const Color cardVariant = Color(0xFFFE0F0F);
  // タイトル text color
  static const Color titleText = Color(0xFF000000);
}

class AppTextStyles {
  static const TextStyle title = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    fontSize: 34.0,
    height: 1.1,
    letterSpacing: -0.68,
    color: AppColors.titleText,
  );
}

class AppTheme {
  static ThemeData get theme => ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: const ColorScheme.light(
          primary: AppColors.header,
          surface: AppColors.background,
        ),
      );
}
