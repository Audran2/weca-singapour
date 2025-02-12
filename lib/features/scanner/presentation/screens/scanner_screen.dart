import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../core/presentation/widgets/modal/bottom_modal.dart'; // Update the import path as necessary

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  bool isScanning = true;
  bool isPopupOpen = false;

  void _showResult(BuildContext context, String result) {
    if (isPopupOpen) return;

    setState(() {
      isPopupOpen = true;
    });

    showCupertinoModalBottomSheet(
      context: context,
      builder: (context) {
        return BottomModal(
          label: "Résultat du scan",
          heightFactor: 0.4,
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(result, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    isPopupOpen = false;
                    isScanning = true;
                  });
                },
                child: const Text("Fermer"),
              ),
            ],
          ),
        );
      },
    ).whenComplete(() {
      setState(() {
        isPopupOpen = false;
        isScanning = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MobileScanner(
            onDetect: (barcodeCapture) {
              if (isScanning && barcodeCapture.barcodes.isNotEmpty) {
                isScanning = false;
                String code = barcodeCapture.barcodes.first.rawValue ?? 'Aucun résultat';

                if (mounted) {
                  _showResult(context, code);
                }

                Future.delayed(const Duration(seconds: 2), () {
                  if (mounted) {
                    setState(() {
                      isScanning = true;
                    });
                  }
                });
              }
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