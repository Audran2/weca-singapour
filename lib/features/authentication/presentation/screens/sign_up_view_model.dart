import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../core/data/http/token_provider.dart';
import '../../../../core/data/result.dart';
import '../../../../core/services/device_service.dart';
import '../../../../core/services/top_dialog_services.dart';
import '../../data/dto/sign_up_dto.dart';
import '../../data/repository/authentication_remote_repository.dart';
import '../../domain/auth_token.dart';

class SignUpViewModel {
  final BuildContext context;

  ValueNotifier<bool> obscurePassword = ValueNotifier(true);
  ValueNotifier<bool> obscureConfirmPassword = ValueNotifier(true);

  ValueNotifier<String> email = ValueNotifier('');
  ValueNotifier<String> userName = ValueNotifier('');
  ValueNotifier<String> password = ValueNotifier('');
  ValueNotifier<String> confirmPassword = ValueNotifier('');

  ValueNotifier<bool> isLoading = ValueNotifier(false);

  SignUpViewModel({required this.context});

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  void toggleConfirmPasswordVisibility() {
    obscureConfirmPassword.value = !obscureConfirmPassword.value;
  }

  Future<void> signUp() async {
    if (isLoading.value) return;

    if (email.value.isEmpty || userName.value.isEmpty || password.value.isEmpty || confirmPassword.value.isEmpty) {
      return DialogService.showTopErrorDialog(context, 'Please fill in all fields');
    }

    if (password.value != confirmPassword.value) {
      return DialogService.showTopErrorDialog(context, 'Passwords do not match');
    }

    isLoading.value = true;

    try {
      final String? deviceName = await DeviceService().getDeviceId();

      final SignUpDTO signUpDTO = SignUpDTO(
        name: userName.value,
        email: email.value,
        password: password.value,
        confirmPassword: confirmPassword.value,
        deviceName: deviceName!,
      );

      final tokenProvider = Provider.of<TokenProviderNotifier>(context, listen: false);
      final repository = AuthenticationRemoteRepository(tokenProvider: tokenProvider);

      final Result<AuthToken> result = await repository.signUp(signUpDTO: signUpDTO);

      if (result.isFailure) {
        return DialogService.showTopErrorDialog(context, result.errorMessage!);
      }

      Provider.of<TokenProviderNotifier>(context, listen: false).setToken(result.data!.token);

      await context.pushNamed('boarding');
    } finally {
      isLoading.value = false;
    }
  }
}