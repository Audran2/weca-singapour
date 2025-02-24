import 'package:dio/dio.dart';

import '../../../../core/data/http/http_client.dart';
import '../../../../core/data/http/token_provider.dart';
import '../../../../core/data/result.dart';
import '../../domain/auth_token.dart';
import '../dto/auth_token_response_dto.dart';
import '../dto/onboarding_user_option_dto.dart';
import '../dto/sign_in_dto.dart';
import '../dto/sign_up_dto.dart';
import 'authentication_repository.dart';

class AuthenticationRemoteRepository extends AuthenticationRepository {
  final HttpClient httpClient;
  final TokenProvider tokenProvider;

  AuthenticationRemoteRepository({HttpClient? httpClient, required this.tokenProvider})
      : httpClient = httpClient ??
      HttpClientImplWithToken(
          rootUrl: "https://weca.lab-rey.fr/api",
          tokenProvider: tokenProvider,
      );

  @override
  Future<Result<AuthToken>> signIn({required SignInDTO signInDTO}) async {
    try {
      final Response<dynamic> response = await httpClient.post("/sanctum/token", data: signInDTO.toJson());

      if (response.statusCode != 200) return Result.failure("Failed to sign in");

      final AuthToken authToken = AuthTokenResponseDTO.fromJson(response.data).toModel();
      return Result.success(authToken);
    } catch (_) {
      return Result.failure("Failed to sign in");
    }
  }

  @override
  Future<Result<AuthToken>> signUp({required SignUpDTO signUpDTO}) async {
    try {
      final Response<dynamic> response = await httpClient.post("/user/register", data: signUpDTO.toJson());

      if (response.statusCode != 200) return Result.failure("Failed to sign up");

      final AuthToken authToken = AuthTokenResponseDTO.fromJson(response.data).toModel();
      return Result.success(authToken);
    } catch (_) {
      return Result.failure("Failed to sign up");
    }
  }

  @override
  Future<Result<void>> updateProfile({required OnboardingUserOptionDTO onboardingUserOptionDTO}) async {
    try {
      final Response<dynamic> response = await httpClient.post("/users", data: onboardingUserOptionDTO.toJson());

      if (response.statusCode != 204) return Result.failure("Failed to update profile");

      return Result.success();
    } catch (_) {
      return Result.failure("Failed to update profile");
    }
  }

}