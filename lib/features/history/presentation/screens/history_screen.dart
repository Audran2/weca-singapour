import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/text_styles.dart';
import '../widgets/dropdown_menu_button.dart';
import '../widgets/history_card.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final double widgetWidth = constraints.maxWidth;
          final double widgetHeight = constraints.maxHeight;

          return Stack(
            children: [
              _buildHeader(widgetWidth, widgetHeight),
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(top: widgetHeight * 0.14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ListView.separated(
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            return const HistoryCard();
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(height: 20);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Positioned _buildHeader(double widgetWidth, double widgetHeight) {
    return Positioned(
      child: Container(
        width: widgetWidth,
        height: widgetHeight * 0.3,
        decoration: const BoxDecoration(
          color: ChartColors.primary500,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -40,
              right: -40,
              child: Transform.rotate(
                angle: -30 * 3.141592653589793 / 180,
                child: SvgPicture.asset(
                  'assets/icons/navbar/history.svg',
                  width: 180,
                  height: 180,
                  colorFilter:
                      const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "History",
                      style: AppTextStyles.titleText1.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    const DropdownMenuButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
