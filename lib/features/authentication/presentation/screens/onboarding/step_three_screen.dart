import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/text_styles.dart';
import '../../widgets/onboarding/boarding_bottom_navigation_bar.dart';
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
                height: MediaQuery.of(context).size.height * 0.6,
                child: PageView(
                  controller: viewModel.pageThreeController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _buildNutriGradeStep(viewModel),
                    _buildEcoGradeStep(viewModel),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: BoardingBottomNavigationBar(
                    pageController: viewModel.pageController,
                  ),
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

  Widget _buildNutriGradeStep(OnboardingViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38),
      child: Column(
        children: [
          Text(
            'Is the Nutri-Grade important\nto you?',
            textAlign: TextAlign.center,
            style: AppTextStyles.titleText3.copyWith(color: AppColors.black),
          ),
          const SizedBox(height: 16),
          const Text(
            'Your selection will affect the information\ndisplayed on the app.',
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyText2,
          ),
          const SizedBox(height: 16),
          StepThreeButtonSelection(
            label: 'Yeah, why not?',
            onPressed: () => viewModel.setNutriGrade('yes'),
            isSelected: viewModel.nutriGrade == 'yes',
          ),
          const SizedBox(height: 24),
          StepThreeButtonSelection(
            label: 'Sometimes, it depends on the product',
            onPressed: () => viewModel.setNutriGrade('sometimes'),
            isSelected: viewModel.nutriGrade == 'sometimes',
          ),
          const SizedBox(height: 24),
          StepThreeButtonSelection(
            label: 'No, I check ingredients instead',
            onPressed: () => viewModel.setNutriGrade('no'),
            isSelected: viewModel.nutriGrade == 'no',
          ),
        ],
      ),
    );
  }

  Widget _buildEcoGradeStep(OnboardingViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38),
      child: Column(
        children: [
          Text(
            'Do you care about the Eco-Grade ?',
            textAlign: TextAlign.center,
            style: AppTextStyles.titleText3.copyWith(color: AppColors.black),
          ),
          const SizedBox(height: 16),
          const Text(
            'Your selection will affect the information\ndisplayed on the app.',
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyText2,
          ),
          const SizedBox(height: 16),
          StepThreeButtonSelection(
            label: 'Yeah, why not?',
            onPressed: () => viewModel.setEcoGrade('yes'),
            isSelected: viewModel.ecoGrade == 'yes',
          ),
          const SizedBox(height: 24),
          StepThreeButtonSelection(
            label: 'Sometimes, it depends on the product',
            onPressed: () => viewModel.setEcoGrade('sometimes'),
            isSelected: viewModel.ecoGrade == 'sometimes',
          ),
          const SizedBox(height: 24),
          StepThreeButtonSelection(
            label: 'No, I check ingredients instead',
            onPressed: () => viewModel.setEcoGrade('no'),
            isSelected: viewModel.ecoGrade == 'no',
          ),
        ],
      ),
    );
  }
}

class StepThreeButtonSelection extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isSelected;

  const StepThreeButtonSelection({
    super.key,
    required this.label,
    required this.onPressed,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(),
      style: TextButton.styleFrom(
        splashFactory: NoSplash.splashFactory,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: isSelected ? 2 : 1,
            color:
                isSelected ? ChartColors.primary700 : AppColors.whiteDisabled,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(vertical: 28),
        minimumSize: const Size(double.infinity, 48),
      ),
      child: Text(
        label,
        style: AppTextStyles.bodyText2.copyWith(color: AppColors.black),
      ),
    );
  }
}
