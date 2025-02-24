import '../../domain/favorite_product_model.dart';

class FavoriteProductResponseDTO {
  final String id;
  final String image;
  final String name;
  final String brand;
  final String barcode;

  FavoriteProductResponseDTO({
    required this.id,
    required this.image,
    required this.name,
    required this.brand,
    required this.barcode,
  });

  factory FavoriteProductResponseDTO.fromJson(Map<String, dynamic> json) {
    return FavoriteProductResponseDTO(
      id: json['id'],
      image: json['image'] != null ? json['image'] : "https://tinasbotanicals.com/wp-content/uploads/2025/01/No-Product-Image-Available.png",
      name: json['name'],
      brand: json['brand'],
      barcode: json['barcode'],
    );
  }

  FavoriteProduct toDomain() {
    return FavoriteProduct(
      id: id,
      image: image,
      name: name,
      brand: brand,
      barcode: barcode,
    );
  }
}