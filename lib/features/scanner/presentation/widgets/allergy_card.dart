import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/styles/text_styles.dart';

class AllergyCard extends StatelessWidget {
  final String label;
  final String icon;
  final Color backgroundColor;
  final Color fontColor;

  const AllergyCard({
    required this.label,
    required this.icon,
    required this.backgroundColor,
    required this.fontColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            icon,
            width: AppTextSize.defaultIcon,
            height: AppTextSize.defaultIcon,
            colorFilter: ColorFilter.mode(
              fontColor,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: AppTextStyles.bodyText3.copyWith(
              color: fontColor,
            ),
          ),
        ],
      ),
    );
  }
}