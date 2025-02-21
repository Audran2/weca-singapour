import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/styles/colors.dart';
import '../../widgets/onboarding/boarding_bottom_navigation_bar.dart';
import '../../widgets/onboarding/eco_grade_view.dart';
import '../../widgets/onboarding/nutri_grade_view.dart';
import 'onboarding_view_model.dart';

class StepThreeScreen extends StatelessWidget {
  const StepThreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<OnboardingViewModel>(
        builder: (context, viewModel, child) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 40),
                child: AnimatedBuilder(
                  animation: viewModel.pageThreeController,
                  builder: (context, child) {
                    final page = viewModel.pageThreeController.hasClients
                        ? viewModel.pageThreeController.page ?? 0.0
                        : 0.0;
                    final indicatorIndex = page < 0.5 ? 1 : 2;
                    return _buildNavigation(indicatorIndex);
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.65,
                child: PageView(
                  controller: viewModel.pageThreeController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    NutriGradeView(viewModel: viewModel),
                    EcoGradeView(viewModel: viewModel),
                  ],
                ),
              ),
              const Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: BoardingBottomNavigationBar(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildNavigation(int indicatorIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          height: 6,
          width: 52,
          decoration: BoxDecoration(
            color: indicatorIndex == 1
                ? ChartColors.secondary500
                : AppColors.whiteInteraction,
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        const SizedBox(width: 8),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          height: 6,
          width: 52,
          decoration: BoxDecoration(
            color: indicatorIndex == 2
                ? ChartColors.secondary500
                : AppColors.whiteInteraction,
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ],
    );
  }
}