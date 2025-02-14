import 'package:flutter/material.dart';

import '../../../styles/colors.dart';
import '../../../styles/dimensions.dart';
import '../../../styles/text_styles.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(
              vertical: AppDimensions.padding.extraLarge,
              horizontal: AppDimensions.padding.medium),
          foregroundColor: AppColors.neutralWhite,
          backgroundColor: ChartColors.primary500,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                AppDimensions.radius.extraLarge),
          ),
          shadowColor: Colors.transparent,
        ),
        onPressed: () => onPressed(),
        child: Text(
          label,
          style: AppTextStyles.largeButtonText
              .copyWith(color: AppColors.neutralWhite),
        ),
      ),
    );
  }
}