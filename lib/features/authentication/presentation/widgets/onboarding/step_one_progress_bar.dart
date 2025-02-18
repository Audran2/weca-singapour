import 'package:flutter/material.dart';

import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/text_styles.dart';

class StepOneProgressBar extends StatelessWidget {
  const StepOneProgressBar({
    super.key,
    required this.currentPageIndex,
  });

  final int currentPageIndex;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 38),
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildStepIndicator(1,
              label: 'Allergies',
              pictureUrl: 'assets/images/allergies/allergies.webp'),
          const SizedBox(width: 20),
          _buildStepIndicator(2,
              label: 'Intolerance',
              pictureUrl: 'assets/images/intolerance/intolerance.webp'),
          const SizedBox(width: 20),
          _buildStepIndicator(3,
              label: 'Disease',
              pictureUrl: 'assets/images/disease/disease.webp'),
          const SizedBox(width: 20),
          _buildStepIndicator(4,
              label: 'Medical\nrestriction',
              pictureUrl:
                  'assets/images/medical_restrictions/medical_restrictions.webp'),
        ],
      ),
    );
  }

  Widget _buildStepIndicator(int stepIndex,
      {required String label, required String pictureUrl}) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: stepIndex == currentPageIndex
            ? ChartColors.primary500
            : ChartColors.primary900,
      ),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 12),
            child: Container(
              width: 66,
              height: 66,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: ChartColors.secondary50,
                border: Border.fromBorderSide(
                  BorderSide(
                    color: ChartColors.secondary300,
                  ),
                ),
              ),
              child: Center(
                child: Image.asset(pictureUrl, width: 40, height: 40),
              ),
            ),
          ),
          Text(
            label,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyText4.copyWith(
                color: stepIndex == currentPageIndex
                    ? AppColors.white
                    : AppColors.whiteDisabled),
          ),
        ],
      ),
    );
  }
}
