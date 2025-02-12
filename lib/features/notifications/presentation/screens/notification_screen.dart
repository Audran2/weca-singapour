import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: MediaQuery.removePadding(
        context: context,
        removeBottom: true,
        child: const Center(child: Text("Notification", style: TextStyle(fontSize: 24))),
      ),
    );
  }
}
