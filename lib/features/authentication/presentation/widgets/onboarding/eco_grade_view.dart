import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/text_styles.dart';
import '../../screens/onboarding/onboarding_view_model.dart';
import 'step_three_button_selection.dart';

class EcoGradeView extends StatelessWidget {
  final OnboardingViewModel viewModel;

  const EcoGradeView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38),
      child: Column(
        children: [
          Text(
            "authentication.boarding.step3.eco_grade.question".tr(),
            textAlign: TextAlign.center,
            style: AppTextStyles.titleText3.copyWith(color: AppColors.black),
          ),
          const SizedBox(height: 16),
          Text(
            "authentication.boarding.step3.eco_grade.description".tr(),
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyText2,
          ),
          const SizedBox(height: 12),
          Text(
            "authentication.boarding.step3.affect".tr(),
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyText4,
          ),
          const SizedBox(height: 16),
          StepThreeButtonSelection(
            label: "authentication.boarding.step3.action_button.yes".tr(),
            onPressed: () => viewModel.setEcoGrade('yes'),
            isSelected: viewModel.ecoGrade == 'yes',
          ),
          const SizedBox(height: 24),
          StepThreeButtonSelection(
            label: "authentication.boarding.step3.action_button.sometimes".tr(),
            onPressed: () => viewModel.setEcoGrade('sometimes'),
            isSelected: viewModel.ecoGrade == 'sometimes',
          ),
          const SizedBox(height: 24),
          StepThreeButtonSelection(
            label: "authentication.boarding.step3.action_button.no".tr(),
            onPressed: () => viewModel.setEcoGrade('no'),
            isSelected: viewModel.ecoGrade == 'no',
          ),
        ],
      ),
    );
  }
}