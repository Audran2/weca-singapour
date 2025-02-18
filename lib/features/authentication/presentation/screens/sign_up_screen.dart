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
import 'sign_up_view_model.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late SignUpViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = SignUpViewModel(context: context);
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
                "Let's,\nCreate Your Account",
                style: AppTextStyles.titleText1
                    .copyWith(color: AppColors.blackNeutral),
              ),
              const SizedBox(height: 48),
              TextFormInput(
                icon: Icons.phone,
                label: "Enter your name",
                onChanged: (String value) {
                  _viewModel.phoneNumber.value = value;
                },
              ),
              SizedBox(height: AppDimensions.margin.xxxLarge),
              TextFormInput(
                icon: Icons.email_outlined,
                label: "Enter your email",
                onChanged: (String value) {
                  _viewModel.email.value = value;
                },
              ),
              SizedBox(height: AppDimensions.margin.xxxLarge),
              PasswordFormInput(
                icon: Icons.lock_outline,
                label: "Enter your password",
                onChanged: (String value) {
                  _viewModel.password.value = value;
                },
                obscureText: true,
                onToggleVisibility: () {
                  _viewModel.togglePasswordVisibility();
                },
              ),
              SizedBox(height: AppDimensions.margin.xxxLarge),
              PasswordFormInput(
                icon: Icons.lock_outline,
                label: "Confirm your password",
                onChanged: (String value) {
                  _viewModel.confirmPassword.value = value;
                },
                obscureText: true,
                onToggleVisibility: () {
                  _viewModel.toggleConfirmPasswordVisibility();
                },
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    PrimaryButton(
                      label: "Create Account",
                      onPressed: () => _viewModel.signUp(),
                    ),
                    SizedBox(height: AppDimensions.margin.xxxLarge),
                    Center(
                      child: Text.rich(
                        TextSpan(
                          text: "Already have an Account? ",
                          style: AppTextStyles.bodyText2
                              .copyWith(color: AppColors.grey200),
                          children: [
                            TextSpan(
                              text: "Sign-In",
                              style: AppTextStyles.bodyText3
                                  .copyWith(color: ChartColors.secondary500),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  context.go('/login');
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
}
