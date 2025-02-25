import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/dimensions.dart';
import '../../../../../core/styles/text_styles.dart';
import '../../../utils/boarding_step_data.dart';
import '../../screens/onboarding/onboarding_view_model.dart';

class StepOneItemList extends StatefulWidget {
  final int currentSubStep;

  const StepOneItemList({required this.currentSubStep, super.key});

  @override
  State<StepOneItemList> createState() => _StepOneItemListState();
}

class _StepOneItemListState extends State<StepOneItemList> {
  int? _expandedIndex;

  @override
  Widget build(BuildContext context) {
    final OnboardingViewModel onboardingViewModel =
        Provider.of<OnboardingViewModel>(context);
    final List<Map<String, String>> items =
        BoardingStepData.getItemsForStep(widget.currentSubStep);
    final double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppDimensions.padding.xxxLarge,
        horizontal: 38,
      ),
      child: SingleChildScrollView(
        child: Wrap(
          spacing: AppDimensions.padding.xxxLarge,
          runSpacing: AppDimensions.padding.xxxLarge,
          children: items.map((item) {
            final int index = items.indexOf(item);
            final bool isExpanded = _expandedIndex == index;
            final bool isSelected = onboardingViewModel.isItemSelected(
                widget.currentSubStep, item["value"]!);

            return GestureDetector(
              onTap: () => onboardingViewModel.toggleSelection(
                  widget.currentSubStep, item["value"]!),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                width: isExpanded ? screenWidth : ((screenWidth / 2) - AppDimensions.padding.xxxLarge * 2 - 2),
                child: _buildCard(item, index, isExpanded, isSelected),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildCard(
      Map<String, String> item, int index, bool isExpanded, bool isSelected) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          height: 200,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color:
                isSelected ? ChartColors.primary200 : ChartColors.secondary50,
            borderRadius: BorderRadius.circular(AppDimensions.radius.xxxLarge),
          ),
          child: isExpanded
              ? Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          item["description"]!,
                          style: AppTextStyles.bodyText2,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () => setState(() {
                          _expandedIndex =
                              (_expandedIndex == index) ? null : index;
                        }),
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.white,
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              isExpanded ? "assets/icons/actions/Close_MD.svg" : "assets/icons/infos/Info.svg",
                              width: 24,
                              height: 24,
                              colorFilter: const ColorFilter.mode(
                                ChartColors.primary500,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : Stack(
                  children: [
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Image.asset(
                        item["image"]!,
                        height: 100,
                      ),
                    ),
                    Positioned(
                      left: 0,
                      bottom: 0,
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () => setState(() {
                          _expandedIndex =
                              (_expandedIndex == index) ? null : index;
                        }),
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.white,
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              "assets/icons/infos/Info.svg",
                              width: 24,
                              height: 24,
                              colorFilter: const ColorFilter.mode(
                                ChartColors.primary500,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
        SizedBox(height: AppDimensions.padding.medium),
        Text(
          item["title"]!,
          style: AppTextStyles.bodyText2,
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
