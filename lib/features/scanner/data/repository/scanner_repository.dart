import 'dart:io';

import '../../../../core/data/result.dart';
import '../../domain/barcode_id.dart';
import '../../domain/product_model.dart';
import '../dto/ask_to_add_product_dto.dart';

abstract class ScannerRepository {
  Future<Result<Product>> getProductByBarcodeId(BarcodeId barcodeId);

  Future<Result<void>> askToAddProduct(AskToAddProductDTO askToAddProductDTO);
}
