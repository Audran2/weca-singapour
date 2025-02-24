import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/text_styles.dart';
import '../widgets/home_card_navigation.dart';
import '../widgets/home_explore_card.dart';
import '../widgets/home_explore_half_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 12, left: 24, right: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: 24),
                const Text(
                  "Your Insights",
                  style: AppTextStyles.bodyText1,
                ),
                const SizedBox(height: 42),
                _buildHomeGrid(context),
                const SizedBox(height: 40),
                HomeExploreCard(
                  title: "home.shop_card.brand_center.title".tr(),
                  description:
                  "home.shop_card.brand_center.description".tr(),
                  imageUrl: 'assets/images/card_lifestyle/brand_center.png',
                  color: ChartColors.primary500,
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HomeExploreHalfCard(
                      title: "home.shop_card.quality_supplements.title".tr(),
                      imageUrl: 'assets/images/card_lifestyle/shop_quality_supplements_now.webp',
                      primaryColor: ChartColors.primary200,
                      secondaryColor: ChartColors.primary50.withValues(alpha: 0.5),
                    ),
                    const SizedBox(width: 24),
                    HomeExploreHalfCard(
                      title: "home.shop_card.quality_gym.title".tr(),
                      imageUrl: 'assets/images/card_lifestyle/shop_quality_gym_apparels_now.webp',
                      primaryColor: ChartColors.secondary200,
                      secondaryColor: ChartColors.secondary50.withValues(alpha: 0.5),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "default.action.explore".tr(),
                      style: AppTextStyles.bodyText1,
                    ),
                    SvgPicture.asset(
                      'assets/icons/actions/Arrow_Right_MD.svg',
                      height: AppTextSize.defaultIcon,
                      width: AppTextSize.defaultIcon,
                    )
                  ],
                ),
                const SizedBox(height: 40),
                HomeExploreCard(
                  title: "home.dietitians.title".tr(),
                  description: "home.dietitians.description".tr(),
                  imageUrl: 'assets/images/card_lifestyle/consult_dietitians.png',
                  color: ChartColors.primary500,
                ),
                const SizedBox(height: 40),
                HomeExploreCard(
                  title: "home.faq.title".tr(),
                  description: "home.faq.description".tr(),
                  imageUrl: 'assets/images/card_lifestyle/faq_on_allergies.png',
                  color: ChartColors.secondary500,
                ),
                const SizedBox(height: 24),
                GestureDetector(
                  onTap: () => context.pushNamed('articles'),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "home.articles.action_button.all".tr(),
                        style: AppTextStyles.bodyText1,
                      ),
                      SvgPicture.asset(
                        'assets/icons/actions/Arrow_Right_MD.svg',
                        height: AppTextSize.defaultIcon,
                        width: AppTextSize.defaultIcon,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HomeExploreHalfCard(
                      title: "home.articles.macronutriments.title".tr(),
                      imageUrl: 'assets/images/card_lifestyle/macronutriments.png',
                      primaryColor: ChartColors.primary200,
                      secondaryColor: ChartColors.primary50.withValues(alpha: 0.5),
                    ),
                    const SizedBox(width: 24),
                    HomeExploreHalfCard(
                      title: "home.articles.muscle_growth.title".tr(),
                      imageUrl: 'assets/images/card_lifestyle/muscle_growth.png',
                      primaryColor: ChartColors.secondary200,
                      secondaryColor: ChartColors.secondary50.withValues(alpha: 0.5),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "home.welcome".tr(),
              style: AppTextStyles.titleText3,
            ),
            const Text(
              "Audran",
              style: AppTextStyles.bodyText1,
            ),
          ],
        ),
        Image.asset(
          'assets/images/card_lifestyle/hello_boy.png',
          height: 74,
          width: 74,
        ),
      ],
    );
  }

  GridView _buildHomeGrid(BuildContext context) {
    return GridView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        mainAxisExtent: 200,
      ),
      children: [
        HomeCardNavigation(
          icon: "assets/icons/infos/scanner.svg",
          title: "home.grid_stats.scan.label".tr(),
          subtitle: "home.grid_stats.scan.info".tr(),
          onTap: () => context.push('/scan'),
        ),
        HomeCardNavigation(
          icon: "assets/icons/infos/not_found.svg",
          title: "home.grid_stats.not_found.label".tr(),
          subtitle: "home.grid_stats.not_found.info".tr(),
          onTap: () {
            Fluttertoast.showToast(
              msg: "Feature not available yet",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: AppColors.black,
              textColor: AppColors.white,
              fontSize: 16.0,
            );
          },
        ),
        HomeCardNavigation(
          icon: "assets/icons/infos/success.svg",
          title: "home.grid_stats.success.label".tr(),
          subtitle: "home.grid_stats.success.info".tr(),
          onTap: () {
            Fluttertoast.showToast(
              msg: "Feature not available yet",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: AppColors.black,
              textColor: AppColors.white,
              fontSize: 16.0,
            );
          },
        ),
        HomeCardNavigation(
          icon: "assets/icons/infos/favorite.svg",
          title: "home.grid_stats.favorite.label".tr(),
          subtitle: "home.grid_stats.favorite.info".tr(),
          onTap: () => context.push('/favorites'),
        ),
      ],
    );
  }
}
