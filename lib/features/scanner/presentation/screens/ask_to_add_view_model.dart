import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/data/http/token_provider.dart';
import '../../../../core/data/result.dart';
import '../../../../core/services/top_dialog_services.dart';
import '../../../favorites/data/repository/favorite_remote_repository.dart';
import '../../data/dto/ask_to_add_product_dto.dart';
import '../../data/repository/scanner_remote_repository.dart';
import '../../domain/barcode_id.dart';
import '../../domain/product_id.dart';

class AskToAddViewModel {
  final BuildContext context;
  final BarcodeId barcode;

  ValueNotifier<List<File>> images = ValueNotifier([]);

  AskToAddViewModel({required this.context, required this.barcode});

  Future<void> sendDemand(BuildContext context, ProductId productId) async {
    final tokenProvider =
    Provider.of<TokenProviderNotifier>(context, listen: false);
    final ScannerRemoteRepository repository = ScannerRemoteRepository(
        tokenProvider: tokenProvider);

    final AskToAddProductDTO askToAddProductDTO = AskToAddProductDTO(
        barcode: barcode,
        images: images.value
    );

    final Result<void> result = await repository.askToAddProduct(
        askToAddProductDTO);

    if (result.isFailure) {
      DialogService.showTopErrorDialog(context, result.errorMessage!);
    }

    DialogService.showTopSuccessDialog(
        context, "YOUPIIII");
  }

  void dispose() {
    images.dispose();
  }
}
