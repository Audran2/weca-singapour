import 'package:flutter/material.dart';

import '../../../styles/colors.dart';
import '../../../styles/dimensions.dart';

class TextFormInput extends StatelessWidget {
  final String label;
  final ValueChanged<String> onChanged;

  const TextFormInput({
    required this.label,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      decoration: BoxDecoration(
        color: AppColors.lightGrey.withValues(alpha: .6),
        borderRadius: BorderRadius.circular(AppDimensions.radius.extraLarge),
      ),
      child: Row(
        children: [
          const Icon(Icons.email_outlined, color: AppColors.grey200),
          SizedBox(width: AppDimensions.margin.medium),
          Expanded(
            child: TextField(
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
        ],
      ),
    );
  }
}