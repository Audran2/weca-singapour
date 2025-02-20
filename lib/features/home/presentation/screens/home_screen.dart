import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                _buildHomeGrid(),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Explore More",
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
                const HomeExploreCard(
                  title: "Consult dietitians",
                  description:
                      "Expert nutrition guidance\n& personalized plans",
                  imageUrl: 'assets/images/card_lifestyle/consult_dietitians.png',
                  color: ChartColors.primary500,
                ),
                const SizedBox(height: 40),
                const HomeExploreCard(
                  title: "FAQ on allergies",
                  description: "Empower Your Body,\nAchieve Your Goals",
                  imageUrl: 'assets/images/card_lifestyle/faq_on_allergies.png',
                  color: ChartColors.secondary500,
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HomeExploreHalfCard(
                      title: "Shop Quality\nSupplements Now",
                      imageUrl: 'assets/images/card_lifestyle/shop_quality_supplements_now.webp',
                      primaryColor: ChartColors.primary200,
                      secondaryColor: ChartColors.primary50.withValues(alpha: 0.5),
                    ),
                    const SizedBox(width: 24),
                    HomeExploreHalfCard(
                      title: "Shop Quality Gym\nApparels Now",
                      imageUrl: 'assets/images/card_lifestyle/shop_quality_gym_apparels_now.webp',
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
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello 👋🏻",
              style: AppTextStyles.titleText3,
            ),
            Text(
              "John",
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

  GridView _buildHomeGrid() {
    return GridView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        mainAxisExtent: 200,
      ),
      children: const [
        HomeCardNavigation(
          icon: Icons.qr_code_scanner,
          title: "Scan new",
          subtitle: "Scanned 483",
        ),
        HomeCardNavigation(
          icon: Icons.error_outline,
          title: "Not found",
          subtitle: "23 products",
        ),
        HomeCardNavigation(
          icon: Icons.check_circle_outline,
          title: "Success",
          subtitle: "8 products",
        ),
        HomeCardNavigation(
          icon: Icons.favorite_border,
          title: "Favorite",
          subtitle: "26 products",
        ),
      ],
    );
  }
}
