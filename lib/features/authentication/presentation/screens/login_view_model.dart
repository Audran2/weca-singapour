import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../core/data/http/token_provider.dart';
import '../../../../core/data/result.dart';
import '../../../../core/services/device_service.dart';
import '../../../../core/services/top_dialog_services.dart';
import '../../data/dto/sign_in_dto.dart';
import '../../data/repository/authentication_remote_repository.dart';
import '../../domain/auth_token.dart';

class LoginViewModel {
  final BuildContext context;

  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  final ValueNotifier<bool> obscureText = ValueNotifier(true);
  final ValueNotifier<String> email = ValueNotifier('');
  final ValueNotifier<String> password = ValueNotifier('');

  LoginViewModel({required this.context});

  void togglePasswordVisibility() {
    obscureText.value = !obscureText.value;
  }

  Future<void> login() async {
    if (isLoading.value) return;

    isLoading.value = true;

    try {
      if (email.value.isEmpty || password.value.isEmpty) {
        return DialogService.showTopErrorDialog(
            context, 'Please fill in all fields');
      }

      final String? deviceName = await DeviceService().getDeviceId();

      final SignInDTO signInDTO = SignInDTO(
          email: email.value,
          password: password.value,
          deviceName: deviceName ?? "");

      final tokenProvider =
          Provider.of<TokenProviderNotifier>(context, listen: false);
      final repository =
          AuthenticationRemoteRepository(tokenProvider: tokenProvider);

      final Result<AuthToken> result =
          await repository.signIn(signInDTO: signInDTO);

      if (result.isFailure) {
        return DialogService.showTopErrorDialog(context, result.errorMessage!);
      }

      Provider.of<TokenProviderNotifier>(context, listen: false)
          .setToken(result.data!.token);

      context.goNamed('home');
    } finally {
      isLoading.value = false;
    }
  }
}
