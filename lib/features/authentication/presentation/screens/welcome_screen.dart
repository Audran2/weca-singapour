import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/presentation/widgets/button/primary_button.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/styles/dimensions.dart';
import '../../../../core/styles/text_styles.dart';
import '../widgets/welcome_carousel.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

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
                                style: AppTextStyles.headlineSmall,
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
                            const Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      CarouselItem(
                        image: 'assets/images/authentication/welcome-1.png',
                        widget: const Text('Title 2',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
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
