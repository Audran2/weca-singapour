import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/presentation/widgets/bottom_navbar.dart';
import '../features/home/presentation/screen/home_screen.dart';
import '../features/scanner/presentation/screens/scanner_screen.dart';
import '../features/settings/presentation/screens/settings_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          body: child,
          bottomNavigationBar: const BottomNavBar(),
        );
      },
      routes: [
        GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
        GoRoute(path: '/scan', builder: (context, state) => const ScannerScreen()),
        GoRoute(path: '/settings', builder: (context, state) => const SettingsScreen()),
      ],
    ),
  ],
);
