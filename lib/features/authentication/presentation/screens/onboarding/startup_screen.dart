import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/presentation/widgets/button/primary_button.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/dimensions.dart';
import '../../../../../core/styles/text_styles.dart';
import '../../widgets/welcome_carousel.dart';

class StartupScreen extends StatelessWidget {
  const StartupScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    items: [
                      CarouselItem(
                        image: 'assets/images/authentication/welcome-1.png',
                        widget: Column(
                          children: [
                            RichText(
                              text: TextSpan(
                                text:
                                    "authentication.start_up.slider.slide1.title.text".tr(),
                                style: AppTextStyles.titleText1,
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        "authentication.start_up.slider.slide1.title.highlight"
                                            .tr(),
                                    style: const TextStyle(
                                        color: ChartColors.primary500),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text.rich(
                              TextSpan(
                                text:
                                    "authentication.start_up.slider.slide1.description"
                                        .tr(),
                                style: AppTextStyles.bodyText2,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      CarouselItem(
                        image: 'assets/images/authentication/welcome-2.gif',
                        widget: Column(
                          children: [
                            RichText(
                              text: TextSpan(
                                text:
                                    "authentication.start_up.slider.slide2.title.text"
                                        .tr(),
                                style: AppTextStyles.titleText1,
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        "authentication.start_up.slider.slide2.title.highlight"
                                            .tr(),
                                    style: const TextStyle(
                                        color: ChartColors.primary500),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text.rich(
                              TextSpan(
                                text:
                                    "authentication.start_up.slider.slide2.description"
                                        .tr(),
                                style: AppTextStyles.bodyText2,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      CarouselItem(
                        image: 'assets/images/authentication/welcome-3.png',
                        widget: Column(
                          children: [
                            RichText(
                              text: TextSpan(
                                text:
                                    "authentication.start_up.slider.slide3.title.text"
                                        .tr(),
                                style: AppTextStyles.titleText1,
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        "authentication.start_up.slider.slide3.title.highlight"
                                            .tr(),
                                    style: const TextStyle(
                                        color: ChartColors.primary500),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text.rich(
                              TextSpan(
                                text:
                                    "authentication.start_up.slider.slide3.description"
                                        .tr(),
                                style: AppTextStyles.bodyText2,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              PrimaryButton(
                label: "authentication.start_up.button_action".tr(),
                onPressed: () {
                  context.go('/login');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
