import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'scanner_view_model.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  final ScannerViewModel viewModel = ScannerViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MobileScanner(
            onDetect: (barcodeCapture) {
              viewModel.onDetect(barcodeCapture, context);
            },
          ),
          Center(
            child: Container(
              width: 250,
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red, width: 3),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}