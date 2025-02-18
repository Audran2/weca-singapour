import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../../core/presentation/widgets/button/switch_button.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/text_styles.dart';
import '../../widgets/boarding_bottom_navigation_bar.dart';
import 'onboarding_view_model.dart';

class StepTwoScreen extends StatelessWidget {
  const StepTwoScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final OnboardingViewModel onboardingViewModel =
        Provider.of<OnboardingViewModel>(context);

    return Column(
      children: [
        Container(
          color: ChartColors.primary500,
          padding:
              const EdgeInsets.only(top: 80, left: 18, right: 18, bottom: 24),
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
              Text('Food preferences',
                  style: AppTextStyles.subtitleText2.copyWith(
                    color: AppColors.white,
                  ))
            ],
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemCount: 21,
            separatorBuilder: (context, index) {
              if (index == 19) {
                return const SizedBox(height: 40);
              }
              final double paddingSide =
                  MediaQuery.of(context).size.width * 0.2;
              return Divider(
                color: ChartColors.secondary500,
                height: 40,
                thickness: 0.5,
                indent: paddingSide,
                endIndent: paddingSide,
              );
            },
            itemBuilder: (context, index) {
              if (index < 20) {
                return ItemList();
              } else {
                return BoardingBottomNavigationBar(
                  pageController: onboardingViewModel.pageController,
                );
              }
            },
          ),
        ),
      ],
    );
  }
}

class ItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset('assets/icons/infos/Heart_01.svg'),
            const SizedBox(width: 20),
            const Text(
              'Vegetarian',
              style: AppTextStyles.subtitleText2,
            ),
          ],
        ),
        const SwitchButton(),
      ],
    ),
    );
  }
}

