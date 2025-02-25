import '../../domain/user_data_domain.dart';

class UserDataResponseDTO {
  final String name;
  final int productScanned;
  final int productScannedSuccess;
  final int productScannedFailed;
  final int favoriteProducts;

  UserDataResponseDTO({
    required this.name,
    required this.productScanned,
    required this.productScannedSuccess,
    required this.productScannedFailed,
    required this.favoriteProducts,
  });

  factory UserDataResponseDTO.fromJson(Map<String, dynamic> json) {
    return UserDataResponseDTO(
      name: json['name'],
      productScanned: json['scanned'],
      productScannedSuccess: json['existing'],
      productScannedFailed: json['askToAdds'],
      favoriteProducts: json['favorites'],
    );
  }

  UserData toDomain() {
    return UserData(
      name: name,
      productScanned: productScanned,
      productScannedSuccess: productScannedSuccess,
      productScannedFailed: productScannedFailed,
      favoriteProducts: favoriteProducts,
    );
  }
}