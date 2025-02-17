import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerViewModel {
  final ValueNotifier<List<Barcode>> detectedBarcodes = ValueNotifier([]);
  final ValueNotifier<Size> cameraSize = ValueNotifier(Size.zero);
  final ValueNotifier<String> defaultDialogLabel = ValueNotifier('Please, scan your products');

  late AnimationController defaultDialogController;
  late Animation<Offset> defaultDialogOffsetAnimation;
  late AnimationController productDialogController;
  late Animation<Offset> productDialogOffsetAnimation;
  // Timer? _resetTimer;

  void initializeAnimation(TickerProvider vsync) {
    defaultDialogController = AnimationController(
      duration: const Duration(milliseconds: 400),
      reverseDuration: const Duration(milliseconds: 400),
      vsync: vsync,
    );
    defaultDialogOffsetAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, 100),
    ).animate(CurvedAnimation(
      parent: defaultDialogController,
      curve: Curves.easeInOut,
    ));
    productDialogController = AnimationController(
      duration: const Duration(milliseconds: 400),
      reverseDuration: const Duration(milliseconds: 400),
      vsync: vsync,
    );
    productDialogOffsetAnimation = Tween<Offset>(
      begin: const Offset(0, 100),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: productDialogController,
      curve: Curves.easeInOut,
    ));
    showDefaultDialog();
  }

  void showDefaultDialog() {
    defaultDialogController.reverse();
    productDialogController.reverse();
  }

  void showProductDialog() {
    productDialogController.forward();
    defaultDialogController.forward();
  }

  void onBarcodeDetected(BarcodeCapture capture) {
    if (capture.barcodes.isNotEmpty) {
      final List<Barcode> newBarcodes = capture.barcodes.where((barcode) {
        return !detectedBarcodes.value.any((existingBarcode) =>
        existingBarcode.displayValue == barcode.displayValue);
      }).toList();

      if (newBarcodes.isNotEmpty) {
        detectedBarcodes.value = List.from(detectedBarcodes.value)..addAll(newBarcodes);
        showProductDialog();
      }

      if (capture.size != Size.zero) {
        cameraSize.value = capture.size;
      } else {
        cameraSize.value = capture.barcodes.first.size;
      }
    }

    // _resetTimer?.cancel();
    // _resetTimer = Timer(const Duration(milliseconds: 500), () {
    //   detectedBarcodes.value = [];
    //   showDefaultDialog();
    // });
  }

  void dispose() {
    defaultDialogController.dispose();
    productDialogController.dispose();
    detectedBarcodes.dispose();
    defaultDialogLabel.dispose();
    cameraSize.dispose();
    // _resetTimer?.cancel();
  }
}