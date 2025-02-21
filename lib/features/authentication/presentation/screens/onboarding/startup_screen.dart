import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../core/presentation/widgets/button/primary_button.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/dimensions.dart';
import '../../widgets/welcome_carousel.dart';
import 'startup_view_model.dart';

class StartupScreen extends StatelessWidget {
  const StartupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final StartupViewModel viewModel = StartupViewModel(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.padding.xxxLarge),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Center(
                  child: WelcomeCarousel(
                    controller: viewModel.pageController,
                    currentIndex: viewModel.currentIndex,
                    onPageChanged: viewModel.onPageChanged,
                    items: viewModel.carouselItems,
                  ),
                ),
              ),
              ValueListenableBuilder<bool>(
                valueListenable: viewModel.isLastSlide,
                builder: (context, isLast, _) {
                  return PrimaryButton(
                    label: isLast
                        ? "authentication.start_up.button_action".tr()
                        : "default.action.next".tr(),
                    onPressed: viewModel.onButtonPressed,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
