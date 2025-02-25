import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/data/http/token_provider.dart';
import '../../../../core/data/result.dart';
import '../../data/repository/home_remote_repository.dart';
import '../../domain/user_data_domain.dart';

class HomeViewModel {
  BuildContext context;

  final ValueNotifier<UserData?> userData = ValueNotifier(null);

  HomeViewModel({required this.context}) {
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    final tokenProvider = Provider.of<TokenProviderNotifier>(context, listen: false);
    final repository = HomeRemoteRepository(tokenProvider: tokenProvider);

    final Result<UserData> result = await repository.getUserData();

    if (result.isFailure) return;

    userData.value = result.data;
  }

  void dispose() {
    userData.dispose();
  }
}