import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/data/http/token_provider.dart';
import '../../../../core/data/result.dart';
import '../../../../core/services/top_dialog_services.dart';
import '../../data/repository/history_remote_repository.dart';
import '../../domain/product_history_model.dart';

class HistoryViewModel {
  final BuildContext context;
  final ValueNotifier<List<ProductHistory>> historyList = ValueNotifier([]);
  final ValueNotifier<bool> isLoading = ValueNotifier(true);

  HistoryViewModel({required this.context}) {
    fetchHistory();
  }

  Future<void> fetchHistory() async {
    isLoading.value = true;

    try {
      final tokenProvider = Provider.of<TokenProviderNotifier>(context, listen: false);
      final repository = HistoryRemoteRepository(tokenProvider: tokenProvider);

      final Result<List<ProductHistory>> result = await repository.getHistory();

      if (result.isFailure) return DialogService.showTopErrorDialog(context, result.errorMessage!);

      historyList.value = result.data!;
    } finally {
      isLoading.value = false;
    }
  }

  void dispose() {
    historyList.dispose();
    isLoading.dispose();
  }
}
