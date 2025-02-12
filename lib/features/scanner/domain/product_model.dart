import 'product_id.dart';

class Product {
  final ProductId id;
  final String name;
  final String imageUrl;
  final int nutritionGrade;

  Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.nutritionGrade,
  });
}