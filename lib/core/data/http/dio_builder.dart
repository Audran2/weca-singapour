import 'package:dio/dio.dart';

class DioBuilder {
  Dio buildWithToken(String url, String token) {
    final Dio dio = build(url);
    dio.options.headers["Authorization"] = "Bearer $token";
    return dio;
  }

  Dio build(String url) {
    final BaseOptions options =
    BaseOptions(baseUrl: url, headers: {'Content-Type': 'application/json', 'Accept': 'application/json'});
    return Dio(options);
  }
}
