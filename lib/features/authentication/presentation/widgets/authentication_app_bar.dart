import 'package:flutter/material.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/dimensions.dart';
import '../../../../core/styles/text_styles.dart';

class AuthenticationAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onBackButtonPressed;

  const AuthenticationAppBar({
    Key? key,
    required this.onBackButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Row(
        children: [
          IconButton(
            onPressed: () => onBackButtonPressed,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: Container(
              padding: EdgeInsets.all(AppDimensions.padding.large),
              decoration: BoxDecoration(
                color: AppColors.lightGrey.withValues(alpha: .4),
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