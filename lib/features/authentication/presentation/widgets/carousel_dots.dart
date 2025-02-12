import 'package:flutter/material.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/dimensions.dart';
import '../../../../core/styles/durations.dart';

class CarouselDots extends StatelessWidget {
  const CarouselDots({
    super.key,
    required this.totalItems,
    required this.currentIndex,
  });

  final int totalItems;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalItems,
            (index) => AnimatedContainer(
          duration: AppDurations.defaultDuration,
          height: 8,
          margin: EdgeInsets.symmetric(horizontal: AppDimensions.padding.small),
          width: currentIndex == index ? 24 : 12,
          decoration: BoxDecoration(
            color: currentIndex == index
                ? ChartColors.secondary500
                : AppColors.grey,
            borderRadius: BorderRadius.circular(AppDimensions.radius.extraLarge),
          ),
        ),
      ),
    );
  }
}
