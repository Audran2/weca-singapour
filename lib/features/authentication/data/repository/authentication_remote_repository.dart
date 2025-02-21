import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../core/data/http/http_client.dart';
import '../../../../core/data/http/token_provider.dart';
import '../../../../core/data/result.dart';
import '../../domain/auth_token.dart';
import '../dto/auth_token_response_dto.dart';
import '../dto/sign_in_dto.dart';
import '../dto/sign_up_dto.dart';
import 'authentication_repository.dart';

class AuthenticationRemoteRepository extends AuthenticationRepository {
  final HttpClient httpClient;

  AuthenticationRemoteRepository({HttpClient? httpClient})
      : httpClient = httpClient ??
      HttpClientImplWithToken(
          rootUrl: "https://weca.lab-rey.fr/api",
          tokenProvider: TokenProviderNotifier(),
      );

  @override
  Future<Result<AuthToken>> signIn({required SignInDTO signInDTO}) async {
    try {
      final Response<dynamic> response = await httpClient.post("/sanctum/token", data: signInDTO.toJson());

      if (response.statusCode != 200) return Result.failure("Failed to sign in");

      final AuthToken authToken = AuthTokenResponseDTO.fromJson(response.data).toModel();
      return Result.success(authToken);
    } on SocketException {
      return Result.failure("No internet connection");
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
    } catch (e) {
      print(e);
      return Result.failure("Failed to sign up");
    }
  }
}