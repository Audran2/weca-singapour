import 'package:easy_localization/easy_localization.dart';

class UserData {
  final String name;
  final int productScanned;
  final int productScannedSuccess;
  final int productScannedFailed;
  final int favoriteProducts;

  UserData({
    required this.name,
    required this.productScanned,
    required this.productScannedSuccess,
    required this.productScannedFailed,
    required this.favoriteProducts,
  });

  String getProductScanned() {
    return "${"home.grid_stats.scan.info".tr()} ${productScanned.toString()}";
  }

  String getProductScannedSuccess() {
    return "${productScannedSuccess.toString()} ${"home.grid_stats.success.info".tr()}";
  }

  String getProductScannedFailed() {
    return "${productScannedFailed.toString()} ${"home.grid_stats.not_found.info".tr()}";
  }

  String getFavoriteProducts() {
    return "${favoriteProducts.toString()} ${"home.grid_stats.favorite.info".tr()}";
  }
}