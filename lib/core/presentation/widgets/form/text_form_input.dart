import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../styles/colors.dart';
import '../../../styles/dimensions.dart';
import '../../../styles/text_styles.dart';

class TextFormInput extends StatelessWidget {
  final String iconPath;
  final String label;
  final ValueChanged<String> onChanged;

  const TextFormInput({
    required this.iconPath,
    required this.label,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      decoration: BoxDecoration(
        color: AppColors.grey100.withValues(alpha: .6),
        borderRadius: BorderRadius.circular(AppDimensions.radius.extraLarge),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            width: AppTextSize.defaultIcon,
            height: AppTextSize.defaultIcon,
            iconPath,
            colorFilter: const ColorFilter.mode(
              AppColors.neutralGrey3,
              BlendMode.srcIn,
            ),
          ),
          SizedBox(width: AppDimensions.margin.medium),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                isDense: true,
                hintText: label,
                hintStyle: AppTextStyles.bodyText2.copyWith(
                  color: AppColors.neutralGrey3,
                ),
                labelStyle: AppTextStyles.bodyText2.copyWith(
                  color: AppColors.neutralGrey3,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
