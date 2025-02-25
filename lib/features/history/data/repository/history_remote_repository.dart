import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../core/data/http/http_client.dart';
import '../../../../core/data/http/token_provider.dart';
import '../../../../core/data/result.dart';
import '../../domain/product_history_model.dart';
import '../product_history_dto.dart';
import 'history_repository.dart';

class HistoryRemoteRepository extends HistoryRepository {
  final HttpClient httpClient;
  final TokenProvider tokenProvider;

  HistoryRemoteRepository({HttpClient? httpClient, required this.tokenProvider})
      : httpClient = httpClient ??
            HttpClientImplWithToken(
              rootUrl: "https://weca.lab-rey.fr/api",
              tokenProvider: tokenProvider,
            );

  @override
  Future<Result<List<ProductHistory>>> getHistory() async {
    try {
      final Response<dynamic> response =
          await httpClient.get("/histories/my-history");

      if (response.statusCode != 200)
        return Result.failure("history.error.get_history".tr());

      final List<ProductHistory> productHistoryList =
          (response.data["data"] as List<dynamic>).map((item) {
        return ProductHistoryDTO.fromJson(item["product"]).toDomain();
      }).toList();

      return Result.success(productHistoryList);
    } catch (_) {
      return Result.failure("history.error.get_history".tr());
    }
  }
}
