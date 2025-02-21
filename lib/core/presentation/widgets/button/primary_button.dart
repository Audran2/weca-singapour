import 'package:flutter/material.dart';

import '../../../styles/colors.dart';
import '../../../styles/dimensions.dart';
import '../../../styles/text_styles.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  final bool isLoading;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(
              vertical: AppDimensions.padding.extraLarge,
              horizontal: AppDimensions.padding.medium),
          foregroundColor: AppColors.neutralWhite,
          backgroundColor: ChartColors.primary500,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(AppDimensions.radius.extraLarge),
          ),
          shadowColor: Colors.transparent,
        ),
        onPressed: () => isLoading ? () : onPressed(),
        child: isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppColors.neutralWhite),
                ),
              )
            : Text(
                label,
                style: AppTextStyles.largeButtonText
                    .copyWith(color: AppColors.neutralWhite),
              ),
      ),
    );
  }
}
