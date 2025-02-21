import 'package:flutter/material.dart';

import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/text_styles.dart';

class StepThreeButtonSelection extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isSelected;

  const StepThreeButtonSelection({
    super.key,
    required this.label,
    required this.onPressed,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(),
      style: TextButton.styleFrom(
        splashFactory: NoSplash.splashFactory,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: isSelected ? 2 : 1,
            color:
            isSelected ? ChartColors.primary700 : AppColors.whiteDisabled,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(vertical: 28),
        minimumSize: const Size(double.infinity, 48),
      ),
      child: Text(
        label,
        style: AppTextStyles.bodyText2.copyWith(color: AppColors.black),
      ),
    );
  }
}
