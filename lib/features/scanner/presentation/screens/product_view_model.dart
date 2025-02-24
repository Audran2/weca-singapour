import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/data/http/token_provider.dart';
import '../../../favorites/data/repository/favorite_remote_repository.dart';
import '../../domain/product_id.dart';

class ProductViewModel {
  final BuildContext context;
  final ValueNotifier<bool> isLiked = ValueNotifier(false);

  ProductViewModel({required this.context});

  Future<void> toggleLike(ProductId productId) async {
    try {
      final tokenProvider =
          Provider.of<TokenProviderNotifier>(context, listen: false);
      final repository = FavoriteRemoteRepository(tokenProvider: tokenProvider);

      if (isLiked.value) {
        await repository.removeFavorite(productId);
      } else {
        await repository.addFavorite(productId);
      }
    } finally {
      isLiked.value = !isLiked.value;
    }
  }

  void dispose() {
    isLiked.dispose();
  }
}
