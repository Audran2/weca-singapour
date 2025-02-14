import 'package:flutter/material.dart';

import '../../../styles/colors.dart';
import '../../../styles/dimensions.dart';
import '../../../styles/text_styles.dart';

class BottomModal extends StatelessWidget {
  final String label;
  final double heightFactor;
  final Widget body;
  final bool showGestureBar;

  const BottomModal({
    required this.label,
    required this.heightFactor,
    required this.body,
    this.showGestureBar = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: AppColors.white,
        child: Container(
          height: MediaQuery.of(context).size.height * heightFactor,
          padding: EdgeInsets.fromLTRB(AppDimensions.padding.extraLarge, AppDimensions.padding.medium, AppDimensions.padding.extraLarge, 0),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                buildTopBar(showGestureBar),
                SizedBox(height: AppDimensions.margin.extraLarge),
                Expanded(child: body),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildTopBar(bool showGestureBar) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[300]!,
            width: 0.5,
          ),
        ),
      ),
      child: Column(
        children: [
          if (showGestureBar)
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[600],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          Padding(
            padding: showGestureBar
                ? EdgeInsets.all(AppDimensions.padding.extraLarge)
                : EdgeInsets.fromLTRB(AppDimensions.padding.extraLarge, AppDimensions.padding.large, AppDimensions.padding.extraLarge, AppDimensions.padding.extraLarge),
            child: Text(
              label,
              // style: AppTextStyles.titleSmall,
            ),
          ),
        ],
      ),
    );
  }
}
