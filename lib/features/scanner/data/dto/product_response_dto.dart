import '../../domain/product_id.dart';
import '../../domain/product_model.dart';

class ProductResponseDTO {
  final ProductId id;
  final String name;
  final String imageUrl;
  final int nutritionGrade;

  ProductResponseDTO({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.nutritionGrade,
  });

  factory ProductResponseDTO.fromJson(Map<String, dynamic> json) {
    return ProductResponseDTO(
      id: ProductId(json['id']),
      name: json['name'],
      imageUrl: json['imageUrl'],
      nutritionGrade: json['nutritionGrade'],
    );
  }

  Product toDomain() {
    return Product(
      id: id,
      name: name,
      imageUrl: imageUrl,
      nutritionGrade: nutritionGrade,
    );
  }
}