import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/presentation/widgets/bottom_navbar.dart';
import '../features/authentication/presentation/screens/login_screen.dart';
import '../features/authentication/presentation/screens/welcome_screen.dart';
import '../features/history/presentation/screens/history_screen.dart';
import '../features/home/presentation/screens/home_screen.dart';
import '../features/notifications/presentation/screens/notification_screen.dart';
import '../features/profile/presentation/screens/profile_screen.dart';
import '../features/scanner/presentation/screens/scanner_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/welcome',
  routes: [
    GoRoute(
      path: '/welcome',
      builder: (context, state) => const WelcomeScreen(),
    ),

    // Route de login
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          body: child,
          bottomNavigationBar: const BottomNavBar(),
        );
      },
      routes: [
        GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
        GoRoute(
            path: '/notifications',
            builder: (context, state) => const NotificationScreen()),
        GoRoute(
            path: '/scan', builder: (context, state) => const ScannerScreen()),
        GoRoute(
            path: '/history',
            builder: (context, state) => const HistoryScreen()),
        GoRoute(
            path: '/profile',
            builder: (context, state) => const ProfileScreen()),
      ],
    ),
    // GoRoute(path: '/settings', builder: (context, state) => const SettingsScreen()),
  ],
);
