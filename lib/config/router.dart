import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/presentation/widgets/bottom_navbar.dart';
import '../features/authentication/presentation/screens/login_screen.dart';
import '../features/authentication/presentation/screens/onboarding/onboarding_screen.dart';
import '../features/authentication/presentation/screens/onboarding/startup_screen.dart';
import '../features/authentication/presentation/screens/sign_up_screen.dart';
import '../features/history/presentation/screens/history_screen.dart';
import '../features/home/presentation/screens/home_screen.dart';
import '../features/notifications/presentation/screens/notification_screen.dart';
import '../features/profile/presentation/screens/profile_screen.dart';
import '../features/scanner/presentation/screens/product_screen.dart';
import '../features/scanner/presentation/screens/scanner_screen.dart';
import '../features/splash/presentation/screens/splash_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    // Route pour l'écran de démarrage (splash screen)
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/welcome',
      builder: (context, state) => const StartupScreen(),
    ),

    // Route de login
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),

    // Route sign up
    GoRoute(path: '/signup', builder: (context, state) => const SignUpScreen()),

    // Route onboarding
    GoRoute(
        path: '/boarding',
        name: 'boarding',
        builder: (context, state) => const OnboardingScreen()),
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          body: child,
          bottomNavigationBar: const BottomNavBar(),
        );
      },
      routes: [
        GoRoute(
            path: '/',
            name: 'home',
            builder: (context, state) => const HomeScreen()),
        GoRoute(
            path: '/notifications',
            builder: (context, state) => const NotificationScreen()),
        GoRoute(
            path: '/history',
            builder: (context, state) => const HistoryScreen()),
        GoRoute(
            path: '/profile',
            builder: (context, state) => const ProfileScreen()),
      ],
    ),
    // Route de scan
    GoRoute(path: '/scan', builder: (context, state) => const ScannerScreen()),

    GoRoute(
        path: '/product', builder: (context, state) => const ProductScreen()),
    // GoRoute(path: '/settings', builder: (context, state) => const SettingsScreen()),
  ],
);
