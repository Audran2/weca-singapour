import 'package:easy_localization/easy_localization.dart';
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
      body: _buildBody(context),
    );
  }

  SafeArea _buildBody(BuildContext context) {
    return SafeArea(
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
              "authentication.signup.label".tr(),
              style: AppTextStyles.titleText1
                  .copyWith(color: AppColors.blackNeutral),
            ),
            const SizedBox(height: 48),
            TextFormInput(
              iconPath: "assets/icons/inputs/User_02.svg",
              label: "authentication.signup.form.name".tr(),
              onChanged: (String value) {
                _viewModel.userName.value = value;
              },
            ),
            SizedBox(height: AppDimensions.margin.xxxLarge),
            TextFormInput(
              iconPath: "assets/icons/inputs/Mail.svg",
              label: "authentication.signup.form.email".tr(),
              onChanged: (String value) {
                _viewModel.email.value = value;
              },
            ),
            SizedBox(height: AppDimensions.margin.xxxLarge),
            PasswordFormInput(
              iconPath: "assets/icons/inputs/Lock.svg",
              label: "authentication.signup.form.password".tr(),
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
              iconPath: "assets/icons/inputs/Lock.svg",
              label: "authentication.signup.form.confirm_password".tr(),
              onChanged: (String value) {
                _viewModel.confirmPassword.value = value;
              },
              obscureText: true,
              onToggleVisibility: () {
                _viewModel.toggleConfirmPasswordVisibility();
              },
            ),
            _buildBottomSignup(context),
          ],
        ),
      ),
    );
  }

  Expanded _buildBottomSignup(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          PrimaryButton(
            label: "authentication.signup.action_button.signup".tr(),
            onPressed: () => _viewModel.signUp(),
          ),
          SizedBox(height: AppDimensions.margin.xxxLarge),
          Center(
            child: Text.rich(
              TextSpan(
                text: "authentication.signup.action_button.login.text".tr(),
                style:
                    AppTextStyles.bodyText2.copyWith(color: AppColors.grey200),
                children: [
                  TextSpan(
                    text: "authentication.signup.action_button.login.link".tr(),
                    style: AppTextStyles.bodyText3
                        .copyWith(color: ChartColors.secondary500),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        context.pushNamed('login');
                      },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
