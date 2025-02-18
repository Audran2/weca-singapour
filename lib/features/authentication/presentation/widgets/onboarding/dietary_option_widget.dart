import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../../core/presentation/widgets/button/switch_button.dart';
import '../../../../../core/styles/text_styles.dart';
import '../../screens/onboarding/onboarding_view_model.dart';

class DietaryOptionItem extends StatelessWidget {
  final String option;

  const DietaryOptionItem({super.key, required this.option});

  @override
  Widget build(BuildContext context) {
    final OnboardingViewModel viewModel =
    Provider.of<OnboardingViewModel>(context);
    final bool isSelected = viewModel.dietaryPreferences.contains(option);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset('assets/icons/infos/Heart_01.svg'),
              const SizedBox(width: 20),
              Text(
                option,
                style: AppTextStyles.subtitleText2,
              ),
            ],
          ),
          SwitchButton(
            value: isSelected,
            onChanged: (bool value) {
              viewModel.toggleDietaryPreference(option);
            },
          ),
        ],
      ),
    );
  }
}