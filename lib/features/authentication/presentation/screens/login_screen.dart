import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/presentation/widgets/app_bar_default.dart';
import '../../../../core/presentation/widgets/button/primary_button.dart';
import '../../../../core/presentation/widgets/form/password_form_input.dart';
import '../../../../core/presentation/widgets/form/text_form_input.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/styles/dimensions.dart';
import '../../../../core/styles/text_styles.dart';
import 'login_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = LoginViewModel(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBarDefault(
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
                "Hey,\nWelcome Back",
                style: AppTextStyles.titleText1
                    .copyWith(color: AppColors.blackNeutral),
              ),
              const SizedBox(height: 48),
              TextFormInput(
                icon: Icons.email_outlined,
                label: "Enter your email",
                onChanged: (String value) {
                  _viewModel.email.value = value;
                },
              ),
              SizedBox(height: AppDimensions.margin.xxxLarge),
              ValueListenableBuilder<bool>(
                valueListenable: _viewModel.obscureText,
                builder: (context, obscureText, child) {
                  return PasswordFormInput(
                    icon: Icons.lock_outline,
                    label: "Enter your password",
                    onChanged: (String value) {
                      _viewModel.password.value = value;
                    },
                    obscureText: obscureText,
                    onToggleVisibility: _viewModel.togglePasswordVisibility,
                  );
                },
              ),
              SizedBox(height: AppDimensions.margin.xxxLarge),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      "Forget password?",
                      style: AppTextStyles.bodyText3
                          .copyWith(color: ChartColors.secondary500),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    PrimaryButton(
                      label: "Login",
                      onPressed: _viewModel.login,
                    ),
                    SizedBox(height: AppDimensions.margin.xxxLarge),
                    Center(
                      child: Text(
                        "Or Continue with",
                        style: AppTextStyles.subtitleText4.copyWith(
                            color: AppColors.grey200.withValues(alpha: .6)),
                      ),
                    ),
                    SizedBox(height: AppDimensions.margin.extraLarge),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildSocialButton("assets/icons/facebook_icon.png"),
                        SizedBox(width: AppDimensions.margin.xxxLarge),
                        _buildSocialButton("assets/icons/google_icon.png"),
                        SizedBox(width: AppDimensions.margin.xxxLarge),
                        _buildSocialButton("assets/icons/apple_icon.png"),
                      ],
                    ),
                    SizedBox(height: AppDimensions.margin.xxLarge),
                    Center(
                      child: Text.rich(
                        TextSpan(
                          text: "Don’t have an Account? ",
                          style: AppTextStyles.bodyText2
                              .copyWith(color: AppColors.grey200),
                          children: [
                            TextSpan(
                              text: "Sign-Up",
                              style: AppTextStyles.bodyText3
                                  .copyWith(color: ChartColors.secondary500),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  context.go('/signup');
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(String assetPath) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
            color: AppColors.grey200.withValues(alpha: .2), width: 1.5),
      ),
      child: Center(
        child: Image.asset(assetPath, width: 32, height: 32),
      ),
    );
  }
}
