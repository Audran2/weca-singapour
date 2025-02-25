import '../../../../core/data/http/http_client.dart';
import '../../../../core/data/http/token_provider.dart';
import '../../../../core/data/result.dart';
import '../../domain/user_data_domain.dart';
import '../dto/user_data_response_dto.dart';

class HomeRemoteRepository {
  final HttpClient httpClient;
  final TokenProvider tokenProvider;

  HomeRemoteRepository(
      {HttpClient? httpClient, required this.tokenProvider})
      : httpClient = httpClient ??
      HttpClientImplWithToken(
        rootUrl: "https://weca.lab-rey.fr/api",
        tokenProvider: tokenProvider,
      );

  Future<Result<UserData>> getUserData() async {
    try {
      final response = await httpClient.get("/users");

      if (response.statusCode != 200) return Result.failure("home.error.get_user_data");

      final UserData userData = UserDataResponseDTO.fromJson(response.data["data"]).toDomain();
      return Result.success(userData);
    } catch (e) {
      return Result.failure("home.error.get_user_data");
    }
  }
}