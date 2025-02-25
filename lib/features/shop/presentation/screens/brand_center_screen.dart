import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/dimensions.dart';
import '../../../../core/styles/text_styles.dart';
import '../widgets/shop_card_part.dart';
import '../widgets/shop_internal_navigation.dart';

class BrandCenterScreen extends StatefulWidget {
  @override
  _BrandCenterScreenState createState() => _BrandCenterScreenState();
}

class _BrandCenterScreenState extends State<BrandCenterScreen> {
  final List<String> categories = [
    "brand_center.categories.all".tr(),
    "brand_center.categories.nutrition".tr(),
    "brand_center.categories.courses".tr(),
    "brand_center.categories.lamp".tr(),
  ];

  final List<Map<String, dynamic>> items = [
    {
      "image":
          "https://hips.hearstapps.com/hmg-prod/images/mh-trainer-2-1533576998.png",
      "price": "S\$ 60",
      "title": "brand_center.item_data.first.title".tr(),
    },
    {
      "image":
          "https://www.crunch.com/wp-content/uploads/2023/07/CR011SLTH_The-Hub_1600x736_07.28.232-1600x736.jpg",
      "price": "S\$ 158",
      "title": "brand_center.item_data.second.title".tr(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final double widgetWidth = MediaQuery.of(context).size.width;
    final double widgetHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Container(color: AppColors.white)),
          _buildAppBar(widgetWidth, widgetHeight),
          SafeArea(
            child: Container(
              padding: EdgeInsets.only(top: widgetHeight * 0.22),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 32),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: ChartColors.secondary400,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "brand_center.offer.title".tr(),
                          style: AppTextStyles.titleText2
                              .copyWith(color: AppColors.white),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
                              decoration: BoxDecoration(
                                color: ChartColors.secondary50,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                "brand_center.offer.value".tr(),
                                style: AppTextStyles.subtitleText4,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              "brand_center.offer.type".tr(),
                              style: AppTextStyles.subtitleText4
                                  .copyWith(color: AppColors.white),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  ShopInternalNavigation(categories: categories),
                  const SizedBox(height: 32),
                  ShopCardPart(items: items),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Positioned _buildAppBar(double widgetWidth, double widgetHeight) {
    return Positioned(
      child: Container(
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
        width: widgetWidth,
        height: widgetHeight * 0.26,
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
              "brand_center.label".tr(),
              style: AppTextStyles.titleText1.copyWith(
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
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
                        hintText: "brand_center.action.search".tr(),
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
    );
  }
}
