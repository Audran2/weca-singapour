import 'package:flutter/material.dart';

import '../../../../core/styles/dimensions.dart';
import 'carousel_dots.dart';

class WelcomeCarousel extends StatelessWidget {
  const WelcomeCarousel({
    super.key,
    required this.items,
    required this.controller,
    required this.currentIndex,
    required this.onPageChanged,
  });

  final List<CarouselItem> items;
  final PageController controller;
  final ValueNotifier<int> currentIndex;
  final Function(int) onPageChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.62,
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: controller,
                  onPageChanged: onPageChanged,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        AspectRatio(
                          aspectRatio: 1 / 1,
                          child: Image.asset(
                            items[index].image,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: 25),
                        items[index].widget,
                      ],
                    );
                  },
                  itemCount: items.length,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(AppDimensions.padding.xxxLarge),
                child: ValueListenableBuilder<int>(
                  valueListenable: currentIndex,
                  builder: (context, index, _) {
                    return ValueListenableBuilder<int>(
                      valueListenable: currentIndex,
                      builder: (context, index, _) {
                        return CarouselDots(
                          totalItems: items.length,
                          currentIndex: index,
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class CarouselItem {
  final String image;
  final Widget widget;

  CarouselItem({required this.image, required this.widget});
}
