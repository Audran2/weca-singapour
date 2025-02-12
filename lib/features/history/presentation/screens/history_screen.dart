import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: MediaQuery.removePadding(
        context: context,
        removeBottom: true,
        child: const Center(child: Text("History", style: TextStyle(fontSize: 24))),
      ),
    );
  }
}
