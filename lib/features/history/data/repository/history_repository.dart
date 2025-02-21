import '../../../../core/data/result.dart';
import '../../domain/product_history_model.dart';

abstract class HistoryRepository {
  Future<Result<List<ProductHistory>>> getHistory();
}