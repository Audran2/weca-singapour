import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../core/data/result.dart';
import '../../../../core/presentation/widgets/modal/bottom_modal.dart';
import '../../../../core/services/top_dialog_services.dart';
import '../../../../core/styles/dimensions.dart';
import '../../data/repository/scanner_remote_repository.dart';
import '../../domain/barcode_id.dart';
import '../../domain/product_model.dart';

class ScannerViewModel {
  final ScannerRemoteRepository _repository = ScannerRemoteRepository();

  bool isScanning = true;
  bool isPopupOpen = false;

  void onDetect(BarcodeCapture barcodeCapture, BuildContext context) {
    if (isScanning && barcodeCapture.barcodes.isNotEmpty) {
      isScanning = false;
      final String code =
          barcodeCapture.barcodes.first.rawValue ?? 'Aucun résultat';

      getProduct(context, BarcodeId(code));

      Future.delayed(const Duration(seconds: 2), () {
        isScanning = true;
      });
    }
  }

  void _showResult(BuildContext context, Product product) {
    if (isPopupOpen) return;

    isPopupOpen = true;

    showCupertinoModalBottomSheet(
      context: context,
      builder: (context) {
        return BottomModal(
          label: "Résultat du scan",
          heightFactor: 0.3,
          body: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Image.network(product.imageUrl),
              ),
              SizedBox(width: AppDimensions.margin.xxLarge),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name, style: const TextStyle(fontSize: 16)),
                  SizedBox(height: AppDimensions.margin.medium),
                  Text('Nutri-Score: ${product.nutritionGrade}',
                      style: const TextStyle(fontSize: 14)),
                  SizedBox(height: AppDimensions.margin.large),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('En savoir plus'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    ).whenComplete(() {
      isPopupOpen = false;
      isScanning = true;
    });
  }

  Future<void> getProduct(BuildContext context, BarcodeId barcodeId) async {
    final Result result = await _repository.getProductByBarcodeId(barcodeId);

    if (result.isFailure)
      DialogService.showTopErrorDialog(context, result.errorMessage!);

    _showResult(context, result.data);
  }
}
