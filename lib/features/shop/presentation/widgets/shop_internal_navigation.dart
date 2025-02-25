import 'package:flutter/material.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/text_styles.dart';

class ShopInternalNavigation extends StatefulWidget {
  final List<String> categories;

  const ShopInternalNavigation({super.key, required this.categories});

  @override
  _ShopInternalNavigationState createState() => _ShopInternalNavigationState();

}

class _ShopInternalNavigationState extends State<ShopInternalNavigation> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        itemCount: widget.categories.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return const SizedBox(width: 16);
        },
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: selectedIndex == index
                    ? ChartColors.primary400
                    : AppColors.whiteInteraction,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  widget.categories[index],
                  style: AppTextStyles.subtitleText4.copyWith(
                    color: selectedIndex == index
                        ? AppColors.white
                        : AppColors.black,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}