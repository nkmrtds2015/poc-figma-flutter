import 'package:flutter/material.dart';

// Design tokens generated from Figma file: WP1rgKnAzi23pGRGvcBQqG
class AppColors {
  static const Color background = Color(0xFFFFFFFF);
  static const Color header = Color(0xFF0AFF0A);
  static const Color cardDefault = Color(0xFFD9D9D9);
  static const Color cardVariant = Color(0xFFFE0F0F);
  static const Color titleText = Color(0xFF000000);
}

class AppTextStyles {
  static const TextStyle title = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    fontSize: 34,
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
