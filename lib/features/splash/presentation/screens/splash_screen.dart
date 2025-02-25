import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import '../../../../core/styles/colors.dart';
import '../../../authentication/presentation/screens/onboarding/startup_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;
  bool _visible = false;

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    _controller = VideoPlayerController.asset("assets/videos/splash.mp4")
      ..initialize().then((_) {
        if (mounted) {
          setState(() {
            _controller
              ..setLooping(true)
              ..play();
            _visible = true;
          });
        }
      });

    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const StartupScreen()));
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _getVideoBackground() {
    return AnimatedOpacity(
      opacity: _visible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 1000),
      child: FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          width: _controller.value.size.width,
          height: _controller.value.size.height,
          child: VideoPlayer(_controller),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Stack(
          children: <Widget>[
            _getVideoBackground(),
          ],
        ),
      ),
    );
  }
}
