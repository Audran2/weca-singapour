import 'package:flutter/material.dart';

import '../../domain/barcode_id.dart';

class AskToAddScreen extends StatefulWidget {
  final BarcodeId barcode;

  const AskToAddScreen({super.key, required this.barcode});

  @override
  _AskToAddScreenState createState() => _AskToAddScreenState();
}

class _AskToAddScreenState extends State<AskToAddScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Ask to add", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
