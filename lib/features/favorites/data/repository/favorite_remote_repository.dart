import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../core/data/http/http_client.dart';
import '../../../../core/data/http/token_provider.dart';
import '../../../../core/data/result.dart';
import '../../../scanner/domain/product_id.dart';
import '../../../scanner/domain/product_model.dart';
import 'favorite_repository.dart';

class FavoriteRemoteRepository extends FavoriteRepository {
  final HttpClient httpClient;
  final TokenProvider tokenProvider;

  FavoriteRemoteRepository(
      {HttpClient? httpClient, required this.tokenProvider})
      : httpClient = httpClient ??
            HttpClientImplWithToken(
              rootUrl: "https://weca.lab-rey.fr/api",
              tokenProvider: tokenProvider,
            );

  @override
  Future<Result<List<Product>>> getFavorites() async {
    try {
      final Response<dynamic> response = await httpClient.get("/favorites/my-favorite");

      if (response.statusCode != 200) return Result.failure("favorite.error.get_favorites".tr());

      final test = response.data;

      return Result.success();
    } catch (_) {
      return Result.failure("favorite.error.get_favorites".tr());
    }
  }

  @override
  Future<Result<void>> addFavorite(ProductId productId) async {
    try {
      final Response<dynamic> response = await httpClient.post("/favorites/${productId.value}");

      if (response.statusCode != 200) return Result.failure("favorite.error.add_favorite".tr());

      return Result.success();
    } catch (_) {
      return Result.failure("favorite.error.add_favorite".tr());
    }
  }

  @override
  Future<Result<void>> removeFavorite(ProductId productId) async {
    try {
      final Response<dynamic> response = await httpClient.delete("/favorites/${productId.value}");

      if (response.statusCode != 200) return Result.failure("favorite.error.remove_favorite".tr());

      return Result.success();
    } catch (_) {
      return Result.failure("favorite.error.remove_favorite".tr());
    }
  }


}
