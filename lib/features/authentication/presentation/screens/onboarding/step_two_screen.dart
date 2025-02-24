import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/text_styles.dart';
import '../../../utils/boarding_step_data.dart';
import '../../widgets/onboarding/boarding_bottom_navigation_bar.dart';
import '../../widgets/onboarding/dietary_option_widget.dart';
import 'onboarding_view_model.dart';

class StepTwoScreen extends StatelessWidget {
  const StepTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardingViewModel onboardingViewModel =
        Provider.of<OnboardingViewModel>(context);

    final List<Map<String, String>> dietaryOptions = BoardingStepData.dietaryOptions;

    return Column(
      children: [
        _buildHeader(),
        _buildBody(dietaryOptions, onboardingViewModel),
      ],
    );
  }

  Container _buildHeader() {
    return Container(
      color: ChartColors.primary500,
      padding: const EdgeInsets.only(top: 80, left: 18, right: 18, bottom: 24),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: ChartColors.secondary50,
              borderRadius: BorderRadius.circular(12),
            ),
            width: 66,
            height: 66,
            child: Center(
              child: Image.asset(
                'assets/images/food_preferences/food_preferences.webp',
                width: 32,
                height: 32,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Text(
            'Food preferences',
            style: AppTextStyles.subtitleText2.copyWith(
              color: AppColors.white,
            ),
          )
        ],
      ),
    );
  }

  Expanded _buildBody(
      List<Map<String, String>> dietaryOptions, OnboardingViewModel onboardingViewModel) {
    return Expanded(
      child: ListView.separated(
        itemCount: dietaryOptions.length + 1,
        separatorBuilder: (context, index) {
          if (index == dietaryOptions.length - 1) {
            return const SizedBox(height: 40);
          }
          final double paddingSide = MediaQuery.of(context).size.width * 0.2;
          return Divider(
            color: ChartColors.secondary500,
            height: 40,
            thickness: 0.5,
            indent: paddingSide,
            endIndent: paddingSide,
          );
        },
        itemBuilder: (context, index) {
          if (index < dietaryOptions.length) {
            return DietaryOptionItem(
              option: dietaryOptions[index],
            );
          } else {
            return const BoardingBottomNavigationBar();
          }
        },
      ),
    );
  }
}
