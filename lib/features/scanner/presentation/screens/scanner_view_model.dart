import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerViewModel {
  final ValueNotifier<List<Barcode>> detectedBarcodes = ValueNotifier([]);
  final ValueNotifier<Size> cameraSize = ValueNotifier(Size.zero);
  late AnimationController scanProductController;
  late Animation<Offset> scanProductOffsetAnimation;
  late AnimationController productScannedController;
  late Animation<Offset> productScannedOffsetAnimation;
  Timer? _resetTimer;

  void initializeAnimation(TickerProvider vsync) {
    scanProductController = AnimationController(
      duration: const Duration(milliseconds: 400),
      reverseDuration: const Duration(milliseconds: 400),
      vsync: vsync,
    );
    scanProductOffsetAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, 100),
    ).animate(CurvedAnimation(
      parent: scanProductController,
      curve: Curves.easeInOut,
    ));
    productScannedController = AnimationController(
      duration: const Duration(milliseconds: 400),
      reverseDuration: const Duration(milliseconds: 400),
      vsync: vsync,
    );
    productScannedOffsetAnimation = Tween<Offset>(
      begin: const Offset(0, 100),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: productScannedController,
      curve: Curves.easeInOut,
    ));
    showScanProductModal();
  }

  void showScanProductModal() {
    scanProductController.reverse();
    productScannedController.reverse();
  }

  void showProductScannedModal() {
    productScannedController.forward();
    scanProductController.forward();

  }

  void onBarcodeDetected(BarcodeCapture capture) {
    if (capture.barcodes.isNotEmpty) {
      final List<Barcode> newBarcodes = capture.barcodes.where((barcode) {
        return !detectedBarcodes.value.any((existingBarcode) =>
        existingBarcode.displayValue == barcode.displayValue);
      }).toList();

      if (newBarcodes.isNotEmpty) {
        detectedBarcodes.value = List.from(detectedBarcodes.value)..addAll(newBarcodes);
        showProductScannedModal();
      }

      if (capture.size != Size.zero) {
        cameraSize.value = capture.size;
      } else {
        cameraSize.value = capture.barcodes.first.size;
      }
    }

    _resetTimer?.cancel();
    _resetTimer = Timer(const Duration(milliseconds: 500), () {
      detectedBarcodes.value = [];
      showScanProductModal();
    });
  }

  void dispose() {
    scanProductController.dispose();
    productScannedController.dispose();
    detectedBarcodes.dispose();
    cameraSize.dispose();
    _resetTimer?.cancel();
  }
}
