import 'package:flutter/material.dart';
import '../../../styles/colors.dart';
import '../../../styles/dimensions.dart';
import 'text_form_input.dart';

class PasswordFormInput extends TextFormInput {
  final bool obscureText;
  final VoidCallback onToggleVisibility;

  const PasswordFormInput({
    required String label,
    required ValueChanged<String> onChanged,
    required this.obscureText,
    required this.onToggleVisibility,
    super.key,
  }) : super(label: label, onChanged: onChanged);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      decoration: BoxDecoration(
        color: AppColors.lightGrey.withValues(alpha: .6),
        borderRadius: BorderRadius.circular(AppDimensions.radius.extraLarge)
      ),
      child: Row(
        children: [
          const Icon(Icons.lock_outline, color: AppColors.grey200),
          SizedBox(width: AppDimensions.margin.medium),
          Expanded(
            child: TextField(
              obscureText: obscureText,
              decoration: InputDecoration(
                isDense: true,
                hintText: label,
                hintStyle: const TextStyle(color: AppColors.grey200),
                labelStyle: const TextStyle(color: AppColors.grey800),
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
              onChanged: onChanged,
            ),
          ),
          GestureDetector(
            onTap: onToggleVisibility,
            child: Icon(obscureText ? Icons.visibility_off : Icons.visibility,
                color: AppColors.grey200),
          ),
        ],
      ),
    );
  }
}
