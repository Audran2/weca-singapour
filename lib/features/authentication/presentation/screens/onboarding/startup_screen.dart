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
                              text: const TextSpan(
                                text: 'Welcome to ',
                                style: AppTextStyles.titleText1,
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'WECA',
                                    style: TextStyle(
                                        color: ChartColors.primary500),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text.rich(
                              TextSpan(
                                text:
                                    'Scan, analyze, and choose better.\nStart today.',
                                style: TextStyle(fontSize: 16),
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
                              text: const TextSpan(
                                text: 'Health Made ',
                                style: AppTextStyles.titleText1,
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Simple',
                                    style: TextStyle(
                                        color: ChartColors.primary500),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text.rich(
                              TextSpan(
                                text:
                                    'Decipher labels, avoid allergens,\nand eat smarter.',
                                style: TextStyle(fontSize: 16),
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
                              text: const TextSpan(
                                text: 'Smarter ',
                                style: AppTextStyles.titleText1,
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Choices',
                                    style: TextStyle(
                                        color: ChartColors.primary500),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text.rich(
                              TextSpan(
                                text:
                                    'Get personalized advice\nand healthier options.',
                                style: TextStyle(fontSize: 16),
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
                label: 'Get Started',
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
