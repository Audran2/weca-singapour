import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/dimensions.dart';
import '../../../../core/styles/text_styles.dart';

class ScannerDefaultDialog extends StatelessWidget {
  final Animation<Offset> offsetAnimation;
  final String label;

  const ScannerDefaultDialog(
      {super.key, required this.offsetAnimation, required this.label});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30,
      left: MediaQuery.of(context).size.width *
          AppDimensions.scannerDialog.sidePaddingFactor,
      width: MediaQuery.of(context).size.width *
          AppDimensions.scannerDialog.widthFactor,
      child: SlideTransition(
        position: offsetAnimation,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.padding.xxxLarge,
            vertical: AppDimensions.padding.extraLarge,
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius:
                BorderRadius.circular(AppDimensions.radius.extraLarge),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/icons/warning.svg',
                width: AppTextSize.defaultIcon,
                height: AppTextSize.defaultIcon,
              ),
              SizedBox(width: AppDimensions.margin.large),
              Text(
                label,
                style: AppTextStyles.subtitleText3
              ),
            ],
          ),
        ),
      ),
    );
  }
}
