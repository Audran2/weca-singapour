import '../../../../core/data/result.dart';
import '../../domain/barcode_id.dart';
import '../../domain/product_model.dart';

abstract class ScannerRepository {
  Future<Result<Product>> getProductByBarcodeId(BarcodeId barcodeId);
}