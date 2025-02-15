import 'package:flutter/material.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/dimensions.dart';

class ProductScannedDialog extends StatelessWidget {
  final Animation<Offset> offsetAnimation;
  final String label;

  const ProductScannedDialog({super.key, required this.offsetAnimation, required this.label});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30,
      left: MediaQuery
          .of(context)
          .size
          .width * AppDimensions.topDialog.sidePaddingFactor,
      width: MediaQuery
          .of(context)
          .size
          .width * AppDimensions.topDialog.widthFactor,
      child: SlideTransition(
        position: offsetAnimation,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.padding.xxxLarge,
            vertical: AppDimensions.padding.extraLarge,
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(
                AppDimensions.radius.extraLarge),
          ),
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}