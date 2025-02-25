import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/styles/colors.dart';

class ShimmerLoading extends StatelessWidget {
  final double width;
  final double height;

  const ShimmerLoading({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Shimmer.fromColors(
        baseColor: AppColors.whiteDisabled,
        highlightColor: AppColors.whiteInteraction,
        child: Container(
          padding: const EdgeInsets.only(top: 4),
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}
