import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/dimensions.dart';
import '../../../../core/styles/text_styles.dart';
import '../../domain/barcode_id.dart';
import '../../domain/product_model.dart';

class ScannerAskToAddDialog extends StatelessWidget {
  final Animation<Offset> offsetAnimation;
  final BarcodeId? barcode;

  const ScannerAskToAddDialog({
    super.key,
    required this.offsetAnimation,
    required this.barcode,
  });

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
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              bottom: -40,
              left: MediaQuery.of(context).size.width * 0.5 - 60,
              child: Image.asset(
                'assets/images/hand_dialog.png',
                width: 60,
                fit: BoxFit.contain,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.padding.extraLarge,
                vertical: AppDimensions.padding.extraLarge,
              ),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius:
                    BorderRadius.circular(AppDimensions.radius.extraLarge),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(AppDimensions.radius.large),
                    child: SvgPicture.asset(
                      "assets/icons/infos/Triangle_Warning.svg",
                      width: AppTextSize.defaultIcon,
                      height: AppTextSize.defaultIcon,
                      colorFilter: const ColorFilter.mode(
                        ChartColors.secondary700,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  SizedBox(width: AppDimensions.padding.xxLarge),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Unknown product",
                          style: AppTextStyles.bodyText2
                              .copyWith(color: AppColors.grey400),
                        ),
                        SizedBox(height: AppDimensions.margin.small),
                        Text(
                          "Ask for informations ?",
                          style: AppTextStyles.subtitleText3,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: AppDimensions.padding.large),
                  GestureDetector(
                    onTap: () {
                      print("Tapped");
                      print(barcode);
                      if (barcode != null) {
                        context.push('/ask-to-add', extra: barcode);
                      }
                    },
                    child: Container(
                      width: AppDimensions.scannerDialog.buttonSize,
                      height: AppDimensions.scannerDialog.buttonSize,
                      decoration: BoxDecoration(
                        color: ChartColors.primary500,
                        borderRadius:
                            BorderRadius.circular(AppDimensions.radius.large),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/icons/actions/Add_Plus.svg',
                          width: AppTextSize.defaultIcon,
                          height: AppTextSize.defaultIcon,
                          colorFilter: const ColorFilter.mode(
                            AppColors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
