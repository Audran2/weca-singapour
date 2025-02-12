import 'package:flutter/material.dart';

import 'colors.dart';

class TextFontFamily {
  static const String quicksand = 'Quicksand';
  static const String montserrat = 'Montserrat';
}

class AppTextSize {
  static const double labelSmall = 11.0;
  static const double labelMedium = 12.0;
  static const double labelLarge = 14.0;
  static const double bodySmall = 12.0;
  static const double bodyMedium = 14.0;
  static const double bodyLarge = 16.0;
  static const double titleSmall = 14.0;
  static const double titleMedium = 16.0;
  static const double titleLarge = 22.0;
  static const double headlineSmall = 28.0;
  static const double headlineMedium = 32.0;
  static const double headlineLarge = 36.0;
}

class AppTextStyles {
  static const TextStyle headlineLarge = TextStyle(
    color: AppColors.black,
    fontSize: AppTextSize.headlineLarge,
    fontFamily: TextFontFamily.quicksand,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle headlineMedium = TextStyle(
    color: AppColors.black,
    fontSize: AppTextSize.headlineMedium,
    fontFamily: TextFontFamily.quicksand,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle headlineSmall = TextStyle(
    color: AppColors.black,
    fontSize: AppTextSize.headlineSmall,
    fontFamily: TextFontFamily.quicksand,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle titleLarge = TextStyle(
    color: AppColors.black,
    fontSize: AppTextSize.titleLarge,
    fontFamily: TextFontFamily.quicksand,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle titleMedium = TextStyle(
    color: AppColors.black,
    fontSize: AppTextSize.titleMedium,
    fontFamily: TextFontFamily.quicksand,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle titleSmall = TextStyle(
    color: AppColors.black,
    fontSize: AppTextSize.titleSmall,
    fontFamily: TextFontFamily.quicksand,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle bodyLarge = TextStyle(
    color: AppColors.black,
    fontSize: AppTextSize.bodyLarge,
    fontFamily: TextFontFamily.quicksand,
  );

  static const TextStyle bodyMedium = TextStyle(
    color: AppColors.black,
    fontSize: AppTextSize.bodyMedium,
    fontFamily: TextFontFamily.montserrat,
  );

  static const TextStyle bodySmall = TextStyle(
    color: AppColors.black,
    fontSize: AppTextSize.bodySmall,
    fontFamily: TextFontFamily.quicksand,
  );

  static const TextStyle labelLarge = TextStyle(
    color: AppColors.black,
    fontSize: AppTextSize.labelLarge,
    fontFamily: TextFontFamily.quicksand,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle labelMedium = TextStyle(
    color: AppColors.black,
    fontSize: AppTextSize.labelMedium,
    fontFamily: TextFontFamily.quicksand,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle labelSmall = TextStyle(
    color: AppColors.black,
    fontSize: AppTextSize.labelSmall,
    fontFamily: TextFontFamily.quicksand,
    fontWeight: FontWeight.w500,
  );
}