import 'package:dio/dio.dart';

import 'dio_builder.dart';
import 'token_provider.dart';

abstract class HttpClient {

  Future<Response<T>> get<T>(String path, {
    Object? data,
    Map<String, dynamic>? queryParameters
  });

  Future<Response<T>> patch<T>(String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers
  });

  Future<Response<T>> post<T>(String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers
  });

  Future<Response<T>> delete<T>(String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers
  });
}

class HttpClientImplWithToken implements HttpClient {

  final DioBuilder dioBuilder = DioBuilder();

  final String rootUrl;
  final TokenProvider tokenProvider;

  HttpClientImplWithToken({required this.rootUrl, required this.tokenProvider});

  @override
  Future<Response<T>> get<T>(String path, {
    Object? data,
    Map<String, dynamic>? queryParameters
  }) async {
    final String token = await tokenProvider.get();
    final Dio dio = dioBuilder.buildWithToken(rootUrl, token);
    return dio.get<T>(path, data: data, queryParameters: queryParameters);
  }

  @override
  Future<Response<T>> patch<T>(String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers
  }) async {
    final String token = await tokenProvider.get();
    final Dio dio = dioBuilder.buildWithToken(rootUrl, token);
    if(headers != null) {
      dio.options.headers.addAll(headers);
    }
    return dio.patch<T>(path, data: data, queryParameters: queryParameters);
  }

  @override
  Future<Response<T>> post<T>(String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers
  }) async {
    final String token = await tokenProvider.get();
    final Dio dio = dioBuilder.buildWithToken(rootUrl, token);
    if(headers != null) {
      dio.options.headers.addAll(headers);
    }
    return dio.post<T>(path, data: data, queryParameters: queryParameters);
  }

  @override
  Future<Response<T>> delete<T>(String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers
  }) async {
    final String token = await tokenProvider.get();
    final Dio dio = dioBuilder.buildWithToken(rootUrl, token);
    if(headers != null) {
      dio.options.headers.addAll(headers);
    }
    return dio.delete<T>(path, data: data, queryParameters: queryParameters);
  }
}

