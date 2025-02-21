import 'package:dio/dio.dart';

import '../../../../core/data/http/http_client.dart';
import '../../../../core/data/http/token_provider.dart';
import '../../../../core/data/result.dart';
import '../../domain/barcode_id.dart';
import '../../domain/product_id.dart';
import '../../domain/product_model.dart';
import 'scanner_repository.dart';

class ScannerRemoteRepository extends ScannerRepository {
  final HttpClient httpClient;
  final TokenProvider tokenProvider;

  ScannerRemoteRepository({HttpClient? httpClient, required this.tokenProvider})
      : httpClient = httpClient ??
      HttpClientImplWithToken(
        rootUrl: "https://weca.lab-rey.fr/api",
        tokenProvider: tokenProvider,
      );

  @override
  Future<Result<Product>> getProductByBarcodeId(BarcodeId barcodeId) async {
    try {
      final Response<dynamic> response = await httpClient.get("/products/barcode/${barcodeId.value}");

      if (response.statusCode != 200) return Result.failure("Failed to get product");

      final test = response.data;

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