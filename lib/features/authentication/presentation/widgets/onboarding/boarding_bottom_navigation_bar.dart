import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../../core/presentation/widgets/button/primary_button.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/dimensions.dart';
import '../../screens/onboarding/onboarding_view_model.dart';

class BoardingBottomNavigationBar extends StatelessWidget {
  const BoardingBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardingViewModel onBoardingViewModel =
        Provider.of<OnboardingViewModel>(context);

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: AppDimensions.padding.xxxLarge * 1.5,
          right: AppDimensions.padding.xxxLarge * 1.5,
        ),
        child: ValueListenableBuilder(
          valueListenable: onBoardingViewModel.isLoading,
          builder: (context, isLoading, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => isLoading ? () : onBoardingViewModel.goToPreviousStep(),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    side: BorderSide(
                        color: AppColors.grey200.withValues(alpha: .4)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          AppDimensions.radius.extraLarge),
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
                    gradient: _getGradientColor(onBoardingViewModel),
                    label: onBoardingViewModel.progressText,
                    onPressed: () => onBoardingViewModel.onMainButtonPressed(),
                    isLoading: isLoading,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  LinearGradient _getGradientColor(OnboardingViewModel viewModel) {
    final double progress = viewModel.progress.clamp(0.0, 1.0);
    final double effectiveProgress = progress == 0.0 ? 0.001 : progress;

    return LinearGradient(
      colors: const [
        ChartColors.primary500,
        ChartColors.primary500,
        ChartColors.primary900,
        ChartColors.primary900,
      ],
      stops: [0.0, effectiveProgress, effectiveProgress, 1.0],
    );
  }
}
