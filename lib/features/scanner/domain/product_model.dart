import 'product_id.dart';

class Product {
  final ProductId id;
  final String name;
  final String brand;
  final int score;
  final String description;
  final String imageUrl;
  final List<String> allergies;
  final List<String> preferences;
  final List<String> intolerances;
  final List<String> diseases;
  final List<String> medicalRestrictions;
  final List<String> ingredients;
  final List<String> dangerousComponents;

  Product({
    required this.id,
    required this.name,
    required this.brand,
    required this.score,
    required this.description,
    required this.imageUrl,
    required this.allergies,
    required this.preferences,
    required this.intolerances,
    required this.diseases,
    required this.medicalRestrictions,
    required this.ingredients,
    required this.dangerousComponents,
  });
}