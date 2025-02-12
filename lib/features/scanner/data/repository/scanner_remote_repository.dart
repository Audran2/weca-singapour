import '../../../../core/data/result.dart';
import '../../domain/barcode_id.dart';
import '../../domain/product_model.dart';
import 'scanner_repository.dart';

class ScannerRemoteRepository extends ScannerRepository {
  @override
  Future<Result<Product>> getProductByBarcodeId(BarcodeId barcodeId) async {
    return Result.success();
  }
}