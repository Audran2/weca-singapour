import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/boarding_bottom_navigation_bar.dart';
import '../../widgets/step_one_item_list.dart';
import '../../widgets/step_one_progress_bar.dart';
import 'onboarding_view_model.dart';

class StepOneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final OnboardingViewModel onboardingViewModel =
        Provider.of<OnboardingViewModel>(context);

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            StepOneProgressBar(
                currentPageIndex: onboardingViewModel.currentSubStep),
            StepOneItemList(currentSubStep: onboardingViewModel.currentSubStep),
            BoardingBottomNavigationBar(
              pageController: onboardingViewModel.pageController,
            ),
          ],
        ),
      ),
    );
  }
}
