import 'package:flutter/material.dart';

import '../../../../core/styles/dimensions.dart';
import 'carousel_dots.dart';

class WelcomeCarousel extends StatefulWidget {
  const WelcomeCarousel({
    super.key,
    required this.items,
  });

  final List<CarouselItem> items;

  @override
  State<WelcomeCarousel> createState() => _WelcomeCarouselState();
}

class _WelcomeCarouselState extends State<WelcomeCarousel> {
  late PageController controller;
  int currentIndex = 0;

  List<CarouselItem> items = [];

  @override
  void initState() {
    super.initState();
    items = widget.items;
    controller = PageController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(AppDimensions.padding.extraLarge),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimensions.radius.extraLarge),
      ),
      height: MediaQuery.of(context).size.height * 0.62,
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: controller,
                  onPageChanged: (v) {
                    currentIndex = v;
                    setState(() {});
                  },
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppDimensions.padding.xxxLarge),
                      child: Column(
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
                      ),
                    );
                  },
                  itemCount: items.length,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(AppDimensions.padding.xxxLarge),
                child: CarouselDots(
                  totalItems: items.length,
                  currentIndex: currentIndex,
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
