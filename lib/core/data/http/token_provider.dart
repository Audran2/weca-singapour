import 'package:flutter/material.dart';

abstract class TokenProvider {
  Future<String> get();
}

class TokenProviderNotifier with ChangeNotifier implements TokenProvider {
  String? _token;

  String? get token => _token;

  void setToken(String token) {
    _token = token;
    notifyListeners();
  }

  void clearToken() {
    _token = null;
    notifyListeners();
  }

  @override
  Future<String> get() async {
    return _token ?? '';
  }
}