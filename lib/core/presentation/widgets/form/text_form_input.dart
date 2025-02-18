import 'package:flutter/material.dart';

import '../../../styles/colors.dart';
import '../../../styles/dimensions.dart';

class TextFormInput extends StatelessWidget {
  final IconData icon;
  final String label;
  final ValueChanged<String> onChanged;

  const TextFormInput({
    required this.icon,
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
          Icon(icon, color: AppColors.neutralGrey3),
          SizedBox(width: AppDimensions.margin.medium),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                isDense: true,
                hintText: label,
                hintStyle: const TextStyle(color: AppColors.neutralGrey3),
                labelStyle: const TextStyle(color: AppColors.neutralGrey3),
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
