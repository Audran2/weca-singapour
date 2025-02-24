import '../../../../core/data/result.dart';
import '../../../scanner/domain/product_id.dart';
import '../../../scanner/domain/product_model.dart';

abstract class FavoriteRepository {

  Future<Result<List<Product>>> getFavorites();

  Future<Result<void>> addFavorite(ProductId productId);

  Future<Result<void>> removeFavorite(ProductId productId);
}