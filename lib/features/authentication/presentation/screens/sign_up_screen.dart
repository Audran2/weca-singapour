import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/dimensions.dart';
import '../../../../core/styles/text_styles.dart';
import '../widgets/authentication_app_bar.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AuthenticationAppBar(
        onBackButtonPressed: () => context.pop(),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: AppDimensions.padding.xxxLarge,
            left: AppDimensions.padding.xxxLarge,
            right: AppDimensions.padding.xxxLarge,
            bottom: AppDimensions.padding.large,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Let's Create\nYour Account",
                style: AppTextStyles.headlineSmall
                    .copyWith(color: AppColors.grey800),
              ),
              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }
}
