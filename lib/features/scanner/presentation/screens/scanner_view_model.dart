import '../../data/repository/scanner_remote_repository.dart';
import '../../domain/barcode_id.dart';

class ScannerViewModel {
  final ScannerRemoteRepository _repository = ScannerRemoteRepository();

  Future<void> getProduct(BarcodeId barcodeId) async {

  }
}