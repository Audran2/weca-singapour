import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/text_styles.dart';
import '../../widgets/welcome_carousel.dart';

class StartupViewModel {
  final BuildContext context;
  late PageController pageController;
  final ValueNotifier<int> currentIndex = ValueNotifier<int>(0);
  final ValueNotifier<bool> isLastSlide = ValueNotifier<bool>(false);

  StartupViewModel(this.context) {
    pageController = PageController();
  }

  void dispose() {
    pageController.dispose();
    currentIndex.dispose();
    isLastSlide.dispose();
  }

  void onPageChanged(int index) {
    currentIndex.value = index;
    isLastSlide.value = index == 2;
  }

  void onButtonPressed() {
    if (isLastSlide.value) {
      context.pushNamed('login');
    } else {
      pageController.animateToPage(
        currentIndex.value + 1,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  List<CarouselItem> get carouselItems => [
    CarouselItem(
      image: 'assets/images/authentication/welcome-1.png',
      widget: Column(
        children: [
          RichText(
            text: TextSpan(
              text: "authentication.start_up.slider.slide1.title.text".tr(),
              style: AppTextStyles.titleText1,
              children: <TextSpan>[
                TextSpan(
                  text: "authentication.start_up.slider.slide1.title.highlight".tr(),
                  style: const TextStyle(color: ChartColors.primary500),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text.rich(
            TextSpan(
              text: "authentication.start_up.slider.slide1.description".tr(),
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
              text: "authentication.start_up.slider.slide2.title.text".tr(),
              style: AppTextStyles.titleText1,
              children: <TextSpan>[
                TextSpan(
                  text: "authentication.start_up.slider.slide2.title.highlight".tr(),
                  style: const TextStyle(color: ChartColors.primary500),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text.rich(
            TextSpan(
              text: "authentication.start_up.slider.slide2.description".tr(),
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
              text: "authentication.start_up.slider.slide3.title.text".tr(),
              style: AppTextStyles.titleText1,
              children: <TextSpan>[
                TextSpan(
                  text: "authentication.start_up.slider.slide3.title.highlight".tr(),
                  style: const TextStyle(color: ChartColors.primary500),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text.rich(
            TextSpan(
              text: "authentication.start_up.slider.slide3.description".tr(),
              style: AppTextStyles.bodyText2,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  ];
}
