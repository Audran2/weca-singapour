import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/data/http/token_provider.dart';
import '../../../../core/data/result.dart';
import '../../../../core/services/top_dialog_services.dart';
import '../../../favorites/data/repository/favorite_remote_repository.dart';
import '../../domain/product_id.dart';

class ProductViewModel {
  final BuildContext context;
  final bool isFavorite;
  ValueNotifier<bool> isLiked = ValueNotifier(false);

  ProductViewModel({required this.context, required this.isFavorite}) {
    isLiked = ValueNotifier(isFavorite);
  }

  Future<void> toggleLike(BuildContext context, ProductId productId) async {
    final tokenProvider =
        Provider.of<TokenProviderNotifier>(context, listen: false);
    final FavoriteRemoteRepository repository = FavoriteRemoteRepository(tokenProvider: tokenProvider);

    final Result<void> result = isLiked.value
        ? await repository.removeFavorite(productId)
        : await repository.addFavorite(productId);

    if (result.isFailure) {
      DialogService.showTopErrorDialog(context, result.errorMessage!);
      return;
    }

    DialogService.showTopSuccessDialog(
        context,
        isLiked.value
            ? 'favorite.success.remove_favorite'.tr()
            : 'favorite.success.add_favorite'.tr());

    isLiked.value = !isLiked.value;
  }

  void dispose() {
    isLiked.dispose();
  }
}
