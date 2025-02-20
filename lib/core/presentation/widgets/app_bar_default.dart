import 'package:flutter/material.dart';

import '../../styles/colors.dart';
import '../../styles/dimensions.dart';
import '../../styles/text_styles.dart';

class AppBarDefault extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onBackButtonPressed;

  const AppBarDefault({
    Key? key,
    required this.onBackButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          IconButton(
            onPressed: onBackButtonPressed,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: Container(
              padding: EdgeInsets.all(AppDimensions.padding.large),
              decoration: BoxDecoration(
                color: AppColors.grey100.withValues(alpha: .4),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_back_outlined,
                size: AppTextSize.largeButton,
                color: AppColors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}