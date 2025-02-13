import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/services/top_dialog_services.dart';

class LoginViewModel {
  final BuildContext context;

  final ValueNotifier<bool> obscureText = ValueNotifier(true);
  final ValueNotifier<String> email = ValueNotifier('');
  final ValueNotifier<String> password = ValueNotifier('');

  LoginViewModel({required this.context});

  void togglePasswordVisibility() {
    obscureText.value = !obscureText.value;
  }

  Future<void> login() async {
    if (email.value.isEmpty || password.value.isEmpty) {
      return DialogService.showTopErrorDialog(context, 'Please fill in all fields');
    }

    context.goNamed('home');
  }
}