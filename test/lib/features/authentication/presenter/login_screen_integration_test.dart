import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weca/core/data/http/token_provider.dart';
import 'package:weca/core/data/result.dart';
import 'package:weca/core/services/device_service.dart';
import 'package:weca/features/authentication/data/dto/sign_in_dto.dart';
import 'package:weca/features/authentication/data/repository/authentication_remote_repository.dart';
import 'package:weca/features/authentication/domain/auth_token.dart';
import 'package:weca/features/authentication/presentation/screens/login_screen.dart';
import 'package:weca/features/authentication/presentation/screens/login_view_model.dart';

class FakeTokenProviderNotifier extends TokenProviderNotifier {
  String? token;

  @override
  void setToken(String newToken) {
    token = newToken;
    notifyListeners();
  }
}

class MockAuthenticationRemoteRepository extends Mock
    implements AuthenticationRemoteRepository {}

class MockDeviceService extends Mock implements DeviceService {}

Future<void> main() async {
  setUpAll(() {
    registerFallbackValue(SignInDTO(email: '', password: '', deviceName: ''));
  });

  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});

  await EasyLocalization.ensureInitialized();

  testWidgets('Login Screen Integration Test', (WidgetTester tester) async {
    final fakeTokenProvider = FakeTokenProviderNotifier();
    final mockDeviceService = MockDeviceService();
    final mockAuthRepository = MockAuthenticationRemoteRepository();

    when(() => mockAuthRepository.signIn(signInDTO: any(named: 'signInDTO')))
        .thenAnswer((_) async => Result.success(AuthToken(token: 'mock_token')));
    when(() => mockDeviceService.getDeviceId())
        .thenAnswer((_) async => 'mock_device_id');

    final router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          name: 'login',
          builder: (context, state) => Provider<LoginViewModel>(
            create: (context) => LoginViewModel(context: context),
            child: const LoginScreen(),
          ),
        ),
        GoRoute(
          path: '/home',
          name: 'home',
          builder: (context, state) => const Scaffold(body: Center(child: Text('Home Page'))),
        ),
      ],
    );

    await tester.pumpWidget(
      EasyLocalization(
        path: 'assets/translations',
        supportedLocales: const [Locale('en')],
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider<TokenProviderNotifier>.value(
                value: fakeTokenProvider),
            Provider<DeviceService>.value(value: mockDeviceService),
          ],
          child: MaterialApp.router(
            routerConfig: router,
            locale: const Locale('en'),
          ),
        ),
      ),
    );

    expect(find.text('authentication.login.action_button.login'), findsOneWidget);
    expect(find.text('authentication.login.form.email'), findsOneWidget);
    expect(find.text('authentication.login.form.password'), findsOneWidget);

    await tester.enterText(find.byType(TextField).at(0), 'test@example.com');
    await tester.enterText(find.byType(TextField).at(1), 'password123');
    await tester.tap(find.text('authentication.login.action_button.login'));

    await tester.pump();
    await tester.pumpAndSettle();

    verify(() => mockAuthRepository.signIn(signInDTO: any(named: 'signInDTO')))
        .called(1);
    verify(() => mockDeviceService.getDeviceId()).called(1);
  });
}
