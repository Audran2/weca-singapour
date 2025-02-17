import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/boarding_bottom_navigation_bar.dart';
import 'onboarding_view_model.dart';

class StepTwoScreen extends StatelessWidget {
  const StepTwoScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final OnboardingViewModel onboardingViewModel = Provider.of<
        OnboardingViewModel>(context);

    return Column(
      children: [
        const Text('Step Two'),
        BoardingBottomNavigationBar(
          pageController: onboardingViewModel.pageController,
        ),
      ],
    );
  }
}
