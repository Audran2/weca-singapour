import 'package:flutter/material.dart';

import '../../../../core/styles/text_styles.dart';
import '../widgets/home_card_navigation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12.0),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Explore More",
                    style: AppTextStyles.bodyText1,
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_right_alt),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
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
          'assets/images/home/user.png',
          height: 74,
          width: 74,
        ),
      ],
    );
  }

  GridView _buildHomeGrid() {
    return GridView(
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
