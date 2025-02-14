import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerViewModel {
  final ValueNotifier<List<Barcode>> detectedBarcodes = ValueNotifier([]);
  final ValueNotifier<Size> cameraSize = ValueNotifier(Size.zero);

  void onBarcodeDetected(BarcodeCapture capture) {
    detectedBarcodes.value = capture.barcodes;
    if (capture.size != Size.zero) {
      cameraSize.value = capture.size;
    } else if (capture.barcodes.isNotEmpty) {
      cameraSize.value = capture.barcodes.first.size;
    }
  }

  void dispose() {
    detectedBarcodes.dispose();
    cameraSize.dispose();
  }
}
