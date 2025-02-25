import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/dimensions.dart';
import '../../../../core/styles/text_styles.dart';

class BrandCenterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double widgetWidth = MediaQuery.of(context).size.width;
    final double widgetHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Container(color: AppColors.white)),
          Positioned(
            child: Container(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
              width: widgetWidth,
              height: widgetHeight * 0.24,
              decoration: const BoxDecoration(
                color: ChartColors.primary500,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "FIND Your MOST",
                    style: AppTextStyles.titleText1.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 32),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(64),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          width: AppTextSize.defaultIcon,
                          height: AppTextSize.defaultIcon,
                          "assets/icons/inputs/magnifying_glass.svg",
                        ),
                        SizedBox(width: AppDimensions.margin.medium),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: "What are you looking for ?",
                              hintStyle: AppTextStyles.bodyText2.copyWith(
                                color: AppColors.neutralGrey3,
                              ),
                              labelStyle: AppTextStyles.bodyText2.copyWith(
                                color: AppColors.neutralGrey3,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SafeArea(
            child: Container(
              padding: EdgeInsets.only(top: widgetHeight * 0.2),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: ChartColors.secondary400,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Classic dried bio nuts\nNoir tapioca",
                          style: AppTextStyles.titleText2
                              .copyWith(color: AppColors.white),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                              decoration: BoxDecoration(
                                color: ChartColors.secondary50,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Text(
                                "80% off",
                                style: AppTextStyles.subtitleText4,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              "BEST OFFER !",
                              style: AppTextStyles.subtitleText4
                                  .copyWith(color: AppColors.white),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
