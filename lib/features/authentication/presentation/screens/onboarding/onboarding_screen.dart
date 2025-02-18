import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'onboarding_view_model.dart';
import 'step_one_screen.dart';
import 'step_three_screen.dart';
import 'step_two_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OnboardingViewModel(),
      child: Scaffold(
        body: Consumer<OnboardingViewModel>(
          builder: (context, onboardingViewModel, child) {
            return PageView(
              controller: onboardingViewModel.pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) {
                setState(() {
                  onboardingViewModel.boardingStepIndex = index + 1;
                });
              },
              children: [
                StepOneScreen(),
                StepTwoScreen(),
                StepThreeScreen(),
              ],
            );
          },
        ),
      ),
    );
  }
}
