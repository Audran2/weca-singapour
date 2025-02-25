import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../core/data/http/http_client.dart';
import '../../../../core/data/http/token_provider.dart';
import '../../../../core/data/result.dart';
import '../../domain/barcode_id.dart';
import '../../domain/product_model.dart';
import '../dto/ask_to_add_product_dto.dart';
import '../dto/product_response_dto.dart';
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
      final Response<dynamic> response =
          await httpClient.get("/products/barcode/${barcodeId.value}");

      if (response.statusCode == 404) {
        return Result.isNotFound(response.statusMessage);
      }

      if (response.statusCode != 200) {
        return Result.failure("Failed to get product");
      }

      final Product product =
          ProductResponseDTO.fromJson(response.data["data"]).toDomain();
      return Result.success(product);
    } catch (_) {
      return Result.failure("Une erreur est survenue");
    }
  }

  @override
  Future<Result<void>> askToAddProduct(
      AskToAddProductDTO askToAddProductDTO) async {
    try {
      final Response<dynamic> response =
          await httpClient.post("/products", data: askToAddProductDTO.toJson());

      if (response.statusCode != 200)
        return Result.failure("Failed to get product");

      return Result.success();
    } catch (_) {
      return Result.failure("Une erreur est survenue");
    }
  }
}
