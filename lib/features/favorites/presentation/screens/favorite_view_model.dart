import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/data/http/token_provider.dart';
import '../../../../core/data/result.dart';
import '../../../../core/services/top_dialog_services.dart';
import '../../data/repository/favorite_remote_repository.dart';
import '../../domain/favorite_product_model.dart';

class FavoriteViewModel {
  final BuildContext context;
  final ValueNotifier<List<FavoriteProduct>> favoriteList = ValueNotifier([]);
  final ValueNotifier<bool> isLoading = ValueNotifier(true);

  FavoriteViewModel({required this.context}) {
    fetchFavorites();
  }

  Future<void> fetchFavorites() async {
    isLoading.value = true;

    try {
      final tokenProvider = Provider.of<TokenProviderNotifier>(context, listen: false);
      final repository = FavoriteRemoteRepository(tokenProvider: tokenProvider);

      final Result<List<FavoriteProduct>> result = await repository.getFavorites();

      if (result.isFailure) return DialogService.showTopErrorDialog(context, result.errorMessage!);

      favoriteList.value = result.data!;
    } finally {
      isLoading.value = false;
    }
  }

  void dispose() {
    favoriteList.dispose();
    isLoading.dispose();
  }
}
