import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../styles/colors.dart';
import '../../../styles/dimensions.dart';
import '../../../styles/text_styles.dart';
import 'text_form_input.dart';

class PasswordFormInput extends TextFormInput {
  final bool obscureText;
  final VoidCallback onToggleVisibility;

  const PasswordFormInput({
    required String iconPath,
    required String label,
    required ValueChanged<String> onChanged,
    required this.obscureText,
    required this.onToggleVisibility,
    super.key,
  }) : super(iconPath: iconPath, label: label, onChanged: onChanged);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      decoration: BoxDecoration(
          color: AppColors.grey100.withValues(alpha: .6),
          borderRadius: BorderRadius.circular(AppDimensions.radius.extraLarge)),
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
              obscureText: obscureText,
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
          GestureDetector(
            onTap: onToggleVisibility,
            child: SvgPicture.asset(
              width: AppTextSize.defaultIcon,
              height: AppTextSize.defaultIcon,
              obscureText
                  ? "assets/icons/actions/Hide.svg"
                  : "assets/icons/actions/Show.svg",
              colorFilter: const ColorFilter.mode(
                AppColors.neutralGrey3,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
