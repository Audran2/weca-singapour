import 'package:flutter/material.dart';

import 'colors.dart';

class TextFontFamily {
  static const String rubik = 'Rubik';
}

class AppTextSize {
  static const double subtitle1 = 24;
  static const double subtitle2 = 20;
  static const double subtitle3 = 16;
  static const double subtitle4 = 10;
  static const double body1 = 18;
  static const double body2 = 14;
  static const double body3 = 14;
  static const double body4 = 12;
  static const double title1 = 26;
  static const double title2 = 24.6;
  static const double title3 = 22;
  static const double title4 = 18;
  static const double largeButton = 18;
  static const double mediumButton = 14;
  static const double smallButton = 14;

  static const double defaultIcon = 24;
}

class AppTextStyles {
  static const TextStyle subtitleText1 = TextStyle(
    color: AppColors.grey500,
    fontSize: AppTextSize.subtitle1,
    fontFamily: TextFontFamily.rubik,
  );

  static const TextStyle subtitleText2 = TextStyle(
    color: AppColors.grey500,
    fontSize: AppTextSize.subtitle2,
    fontFamily: TextFontFamily.rubik,
  );

  static const TextStyle subtitleText3 = TextStyle(
    color: AppColors.grey500,
    fontSize: AppTextSize.subtitle3,
    fontFamily: TextFontFamily.rubik,
    letterSpacing: 0.5,
  );

  static const TextStyle subtitleText4 = TextStyle(
    color: AppColors.grey500,
    fontSize: AppTextSize.subtitle4,
    fontFamily: TextFontFamily.rubik,
    letterSpacing: 3.0,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle bodyText1 = TextStyle(
    color: AppColors.grey500,
    fontSize: AppTextSize.body1,
    fontFamily: TextFontFamily.rubik,
  );

  static const TextStyle bodyText2 = TextStyle(
    color: AppColors.grey500,
    fontSize: AppTextSize.body2,
    fontFamily: TextFontFamily.rubik,
  );

  static const TextStyle bodyText3 = TextStyle(
    color: AppColors.grey500,
    fontSize: AppTextSize.body3,
    fontFamily: TextFontFamily.rubik,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle bodyText4 = TextStyle(
    color: AppColors.grey500,
    fontSize: AppTextSize.body4,
    fontFamily: TextFontFamily.rubik,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle titleText1 = TextStyle(
    color: AppColors.grey500,
    fontSize:  AppTextSize.title1,
    fontFamily: TextFontFamily.rubik,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle titleText2 = TextStyle(
    color: AppColors.grey500,
    fontSize: AppTextSize.title2,
    fontFamily: TextFontFamily.rubik,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle titleText3 = TextStyle(
    color: AppColors.grey500,
    fontSize: AppTextSize.title3,
    fontFamily: TextFontFamily.rubik,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle titleText4 = TextStyle(
    color: AppColors.grey500,
    fontSize: AppTextSize.title4,
    fontFamily: TextFontFamily.rubik,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle largeButtonText = TextStyle(
    color: AppColors.grey500,
    fontSize: AppTextSize.largeButton,
    fontFamily: TextFontFamily.rubik,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle mediumButtonText = TextStyle(
    color: AppColors.grey500,
    fontSize: AppTextSize.mediumButton,
    fontFamily: TextFontFamily.rubik,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle smallButtonText = TextStyle(
    color: AppColors.grey500,
    fontSize: AppTextSize.smallButton,
    fontFamily: TextFontFamily.rubik,
    fontWeight: FontWeight.w500,
  );
}