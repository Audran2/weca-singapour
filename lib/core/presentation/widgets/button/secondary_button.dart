import 'package:flutter/material.dart';

import '../../../styles/colors.dart';
import '../../../styles/dimensions.dart';
import '../../../styles/text_styles.dart';

class SecondaryButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  final bool isLoading;
  final Gradient? gradient;

  const SecondaryButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ElevatedButton buttonChild = ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          vertical: AppDimensions.padding.extraLarge,
          horizontal: AppDimensions.padding.medium,
        ),
        foregroundColor: gradient != null ? AppColors.neutralWhite : ChartColors.primary500, // Inverse text color
        backgroundColor: Colors.transparent, // Transparent background for secondary button
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radius.extraLarge),
          side: BorderSide(
            color: gradient != null ? AppColors.neutralWhite : ChartColors.primary500, // Border color same as primary button
            width: 2,
          ),
        ),
        shadowColor: Colors.transparent,
      ),
      onPressed: isLoading ? null : () => onPressed(),
      child: isLoading
          ? const SizedBox(
        width: 24,
        height: 24,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(ChartColors.primary500),
        ),
      )
          : Text(
        label,
        style: AppTextStyles.largeButtonText.copyWith(color: gradient != null ? AppColors.neutralWhite : ChartColors.primary500),
      ),
    );

    return SizedBox(
      width: double.infinity,
      height: 55,
      child: gradient != null
          ? Container(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(AppDimensions.radius.extraLarge),
        ),
        child: buttonChild,
      )
          : buttonChild,
    );
  }
}