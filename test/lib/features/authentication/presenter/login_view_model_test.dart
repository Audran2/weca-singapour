import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';
import 'package:weca/core/data/http/token_provider.dart';
import 'package:weca/core/data/result.dart';
import 'package:weca/features/authentication/data/dto/sign_in_dto.dart';
import 'package:weca/features/authentication/data/repository/authentication_remote_repository.dart';
import 'package:weca/features/authentication/presentation/screens/login_view_model.dart';

class MockAuthenticationRemoteRepository extends Mock
    implements AuthenticationRemoteRepository {}

class MockTokenProviderNotifier extends Mock implements TokenProviderNotifier {}

void main() {
  setUpAll(() {
    registerFallbackValue(SignInDTO(email: '', password: '', deviceName: ''));
  });

  testWidgets('Password textfield - invert obscureText value', (WidgetTester tester) async {
    late LoginViewModel viewModel;

    await tester.pumpWidget(MaterialApp(
      home: Builder(
        builder: (context) {
          viewModel = LoginViewModel(context: context);
          return const SizedBox();
        },
      ),
    ));

    final initialValue = viewModel.obscureText.value;
    viewModel.togglePasswordVisibility();
    expect(viewModel.obscureText.value, equals(!initialValue));
  });

  testWidgets('login does not proceed if fields are empty', (WidgetTester tester) async {
    late LoginViewModel viewModel;
    final mockRepository = MockAuthenticationRemoteRepository();

    when(() => mockRepository.signIn(signInDTO: any(named: 'signInDTO')))
        .thenAnswer((_) async => Result.failure("Failed"));

    await tester.pumpWidget(
      MaterialApp(
        home: Overlay(
          initialEntries: [
            OverlayEntry(
              builder: (context) => Provider<AuthenticationRemoteRepository>.value(
                value: mockRepository,
                child: Builder(
                  builder: (context) {
                    viewModel = LoginViewModel(context: context);
                    return const SizedBox();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );

    expect(viewModel.email.value, '');
    expect(viewModel.password.value, '');

    await viewModel.login();
    await tester.pumpAndSettle(const Duration(seconds: 3));

    verifyNever(() => mockRepository.signIn(signInDTO: any(named: 'signInDTO')));
    expect(viewModel.isLoading.value, false);
  });
}
