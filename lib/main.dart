import 'package:flutter/material.dart';
import 'config/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChromeUtils.setImmersiveEdgeToEdgeMode();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'QR Code Scanner',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
