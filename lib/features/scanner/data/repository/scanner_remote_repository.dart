import '../../../../core/data/result.dart';
import '../../domain/barcode_id.dart';
import '../../domain/product_id.dart';
import '../../domain/product_model.dart';
import 'scanner_repository.dart';

class ScannerRemoteRepository extends ScannerRepository {
  @override
  Future<Result<Product>> getProductByBarcodeId(BarcodeId barcodeId) async {
    try {
      // final response = await http.get(Uri.parse('https://api.com/products/${barcodeId.value}'));
      // final json = jsonDecode(response.body);
      // final product = ProductResponseDTO.fromJson(json).toDomain();
      // return Result.success(product);
      return Result.success(Product(
        id: ProductId("1234"),
        name: 'Product name',
        imageUrl: 'https://www.drivezeclerc.re/portail-st-leu/21235-thickbox_default/biscuit-multicereales-gout-chocolat-x15-prince-lu-293grs.jpg',
        nutritionGrade: 3,
      ));
      // return Result.failure("Une erreur est survenue");
    } catch (_) {
      return Result.failure("Une erreur est survenue");
    }
  }
}