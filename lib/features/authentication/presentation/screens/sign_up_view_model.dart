import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/services/top_dialog_services.dart';

class SignUpViewModel {
  final BuildContext context;

  ValueNotifier<bool> obscurePassword = ValueNotifier(true);
  ValueNotifier<bool> obscureConfirmPassword = ValueNotifier(true);

  ValueNotifier<String> email = ValueNotifier('');
  ValueNotifier<String> phoneNumber = ValueNotifier('');
  ValueNotifier<String> password = ValueNotifier('');
  ValueNotifier<String> confirmPassword = ValueNotifier('');

  SignUpViewModel({required this.context});

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  void toggleConfirmPasswordVisibility() {
    obscureConfirmPassword.value = !obscureConfirmPassword.value;
  }

  Future<void> signUp() async {
    if (email.value.isEmpty || phoneNumber.value.isEmpty || password.value.isEmpty || confirmPassword.value.isEmpty) {
      return DialogService.showTopErrorDialog(context, 'Please fill in all fields');
    }

    await context.pushNamed('boarding');
  }
}