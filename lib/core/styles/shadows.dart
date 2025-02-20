import 'package:flutter/material.dart';

import 'colors.dart';

class AppShadows {
  static BoxShadow defaultShadow = const BoxShadow(
    color: AppColors.black,
    blurRadius: 10.0,
    offset: Offset(0, 10),
  );

  static BoxShadow bottomNavShadow =
      const BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 2);

  static BoxShadow historyCardShadow = BoxShadow(
    color: Colors.black.withValues(alpha: 0.1),
    blurRadius: 10.0,
  );
}
