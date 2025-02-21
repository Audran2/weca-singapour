import '../../domain/auth_token.dart';

class AuthTokenResponseDTO {
  final String token;

  AuthTokenResponseDTO({required this.token});

  factory AuthTokenResponseDTO.fromJson(Map<String, dynamic> json) {
    return AuthTokenResponseDTO(
      token: json['token'],
    );
  }

  AuthToken toModel() {
    return AuthToken(
      token: token,
    );
  }
}