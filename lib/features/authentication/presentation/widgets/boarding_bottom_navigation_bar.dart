import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../core/presentation/widgets/button/primary_button.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/styles/dimensions.dart';
import '../screens/onboarding/onboarding_view_model.dart';

class BoardingBottomNavigationBar extends StatelessWidget {
  final PageController pageController;

  const BoardingBottomNavigationBar({
    super.key,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    final OnboardingViewModel onBoardingViewModel = Provider.of<OnboardingViewModel>(context);

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: AppDimensions.padding.xxxLarge * 1.5,
          right: AppDimensions.padding.xxxLarge * 1.5,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () => onBoardingViewModel.goToPreviousStep(),
              style: TextButton.styleFrom(
                backgroundColor: Colors.transparent,
                side:
                    BorderSide(color: AppColors.grey200.withValues(alpha: .4)),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(AppDimensions.radius.extraLarge),
                ),
                minimumSize: const Size(58, 58),
                padding: EdgeInsets.zero,
              ),
              child: SvgPicture.asset(
                'assets/icons/actions/Chevron_Left.svg',
                colorFilter: const ColorFilter.mode(
                  ChartColors.primary700,
                  BlendMode.srcIn,
                ),
                width: 24,
                height: 24,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: PrimaryButton(
                label: 'Next step',
                onPressed: () => onBoardingViewModel.goToNextStep(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
