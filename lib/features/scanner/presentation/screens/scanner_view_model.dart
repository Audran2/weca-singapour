import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';

import '../../../../core/data/http/token_provider.dart';
import '../../../../core/data/result.dart';
import '../../data/repository/scanner_remote_repository.dart';
import '../../domain/barcode_id.dart';
import '../../domain/product_model.dart';

class ScannerViewModel {
  final BuildContext context;

  ScannerViewModel({required this.context});

  final ValueNotifier<List<Barcode>> detectedBarcodes = ValueNotifier([]);
  ValueNotifier<Product?> product = ValueNotifier(null);
  final ValueNotifier<Size> cameraSize = ValueNotifier(Size.zero);

  late AnimationController defaultDialogController;
  late Animation<Offset> defaultDialogOffsetAnimation;
  late AnimationController productDialogController;
  late Animation<Offset> productDialogOffsetAnimation;
  Timer? _resetTimer;

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

  Future<void> onBarcodeDetected(BarcodeCapture capture) async {
    if (capture.barcodes.isNotEmpty) {
      final List<Barcode> newBarcodes = capture.barcodes.where((barcode) {
        return !detectedBarcodes.value.any((existingBarcode) =>
        existingBarcode.displayValue == barcode.displayValue);
      }).toList();

      if (newBarcodes.isNotEmpty) {
        detectedBarcodes.value = List.from(detectedBarcodes.value)..addAll(newBarcodes);

        final tokenProvider =
            Provider.of<TokenProviderNotifier>(context, listen: false);
        final repository =
            ScannerRemoteRepository(tokenProvider: tokenProvider);

        final Result<Product> result =
            await repository.getProductByBarcodeId(BarcodeId(detectedBarcodes.value.first.displayValue!));

        if (result.isFailure) {
          product.value = null;
          return;
        }

        product.value = result.data;
        showProductDialog();
      }

      if (capture.size != Size.zero) {
        cameraSize.value = capture.size;
      } else {
        cameraSize.value = capture.barcodes.first.size;
      }
    }

    _resetTimer?.cancel();
    _resetTimer = Timer(const Duration(seconds: 45), () {
      detectedBarcodes.value = [];
      product.value = null;
      showDefaultDialog();
    });

  }

  void dispose() {
    defaultDialogController.dispose();
    productDialogController.dispose();
    detectedBarcodes.dispose();
    cameraSize.dispose();
    _resetTimer?.cancel();
  }
}
