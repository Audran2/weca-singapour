import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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

  late AnimationController defaultDialogController;
  late Animation<Offset> defaultDialogOffsetAnimation;

  ValueNotifier<List<File>> images = ValueNotifier([]);
  ValueNotifier<bool> isLoading = ValueNotifier(false);

  AskToAddViewModel({required this.context, required this.barcode});

  Future<void> sendDemand(BuildContext context) async {
    isLoading.value = true;
    final tokenProvider =
        Provider.of<TokenProviderNotifier>(context, listen: false);
    final ScannerRemoteRepository repository =
        ScannerRemoteRepository(tokenProvider: tokenProvider);

    final AskToAddProductDTO askToAddProductDTO =
        AskToAddProductDTO(barcode: barcode, images: images.value);

    final Result<void> result =
        await repository.askToAddProduct(askToAddProductDTO);

    isLoading.value = false;

    if (result.isFailure) {
      DialogService.showTopErrorDialog(context, result.errorMessage!);
      return;
    }

    DialogService.showTopSuccessDialog(context, "Ask sent !");
    context.pop();
  }

  void addImage(String path) {
    images.value.add(File(path));
  }

  void removeImage(File file) {
    final updatedImages = List<File>.from(images.value) // Create a new list
      ..remove(file); // Remove the image
    images.value = updatedImages; // Assign the new list to trigger a rebuild
  }

  void initializeAnimation(TickerProvider vsync) {
    defaultDialogController = AnimationController(
      duration: const Duration(milliseconds: 400),
      reverseDuration: const Duration(milliseconds: 400),
      vsync: vsync,
    );
    defaultDialogOffsetAnimation = Tween<Offset>(
      begin: const Offset(0, 100),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: defaultDialogController,
      curve: Curves.easeInOut,
    ));

    showDefaultDialog();
  }

  void showDefaultDialog() {
    defaultDialogController.forward();
  }

  void dispose() {
    images.dispose();
  }
}
