import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/styles/text_styles.dart';

class AllergyTag extends StatelessWidget {
  final String label;
  final String icon;
  final Color backgroundColor;
  final Color iconColor;
  final Color fontColor;

  const AllergyTag({
    required this.label,
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
    required this.fontColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SvgPicture.asset(
              icon,
              width: AppTextSize.defaultIcon,
              height: AppTextSize.defaultIcon,
              colorFilter: ColorFilter.mode(
                iconColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: AppTextStyles.subtitleText5.copyWith(
            color: fontColor,
          ),
        ),
      ],
    );
  }
}