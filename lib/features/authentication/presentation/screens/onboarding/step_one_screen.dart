import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/onboarding/boarding_bottom_navigation_bar.dart';
import '../../widgets/onboarding/step_one_item_list.dart';
import '../../widgets/onboarding/step_one_progress_bar.dart';
import 'onboarding_view_model.dart';

class StepOneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<OnboardingViewModel>(
        builder: (context, viewModel, child) {
          return Column(
            children: [
              AnimatedBuilder(
                animation: viewModel.pageOneController,
                builder: (context, child) {
                  final double page = viewModel.pageOneController.hasClients
                      ? viewModel.pageOneController.page ?? 0.0
                      : 0.0;
                  final currentIndicator = page.round() + 1;
                  return StepOneProgressBar(
                    currentPageIndex: currentIndicator,
                    onStepTapped: (int subStep) {
                      viewModel.goToStepOneSubStep(subStep);
                    },
                  );
                },
              ),
              Expanded(
                child: PageView(
                  controller: viewModel.pageOneController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: List.generate(4, (index) => StepOneItemList(currentSubStep: index + 1)),
                ),
              ),
              const BoardingBottomNavigationBar(),
            ],
          );
        },
      ),
    );
  }
}

