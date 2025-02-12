import 'package:flutter/material.dart';

import 'colors.dart';

class AppShadows {
  static BoxShadow defaultShadow = const BoxShadow(
    color: AppColors.black,
    blurRadius: 10.0,
    offset: Offset(0, 10),
  );
}