import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/shadows.dart';
import '../../../../core/styles/text_styles.dart';
import '../../domain/product_history_model.dart';

class HistoryCard extends StatelessWidget {
  final ProductHistory productHistory;

  const HistoryCard({super.key, required this.productHistory});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(boxShadow: [AppShadows.historyCardShadow]),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: ChartColors.secondary50,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/icons/infos/Shopping_Bag_02.svg',
                          width: 20,
                          height: 20,
                          colorFilter: const ColorFilter.mode(
                            ChartColors.secondary500,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "ChocoFit Cereal Bar",
                      style: AppTextStyles.subtitleText3,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: ChartColors.secondary50,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/icons/infos/Info.svg',
                          width: 20,
                          height: 20,
                          colorFilter: const ColorFilter.mode(
                            ChartColors.secondary500,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "Nutri-Score : B",
                      style: AppTextStyles.subtitleText3,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: ChartColors.secondary50,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/icons/infos/Octagon_Warning.svg',
                          width: 20,
                          height: 20,
                          colorFilter: const ColorFilter.mode(
                              ChartColors.secondary500, BlendMode.srcIn),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "Contains traces of gluten",
                      style: AppTextStyles.subtitleText3,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: AppColors.whiteDisabled,
              border: Border(
                top: BorderSide(
                  color: AppColors.whiteDisabled,
                ),
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: ChartColors.secondary50,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/icons/infos/Triangle_Warning.svg',
                          width: 20,
                          height: 20,
                          colorFilter: const ColorFilter.mode(
                            ChartColors.secondary500,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "Not compatible with your Halal diet",
                      style: AppTextStyles.bodyText3,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "View",
                      style: AppTextStyles.bodyText3
                          .copyWith(color: ChartColors.primary600),
                    ),
                    const SizedBox(width: 4),
                    SvgPicture.asset(
                      'assets/icons/actions/Chevron_Right.svg',
                      colorFilter: const ColorFilter.mode(
                        ChartColors.primary700,
                        BlendMode.srcIn,
                      ),
                      height: 16,
                      width: 16,
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
