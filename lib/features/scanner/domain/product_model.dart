import 'item_model.dart';
import 'product_id.dart';

class Product {
  final ProductId id;
  final String name;
  final String brand;
  final String score;
  final String description;
  final String imageUrl;
  final List<Item> allergies;
  final List<Item> preferences;
  final List<Item> intolerances;
  final List<Item> diseases;
  final List<Item> medicalRestrictions;
  final List<String> ingredients;
  final List<Item> dangerousComponents;

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

  String getBrand() {
    if (brand.length > 15) return "${brand.substring(0, 12)}...";

    return brand;
  }

  String getName() {
    if (name.length > 15) return "${name.substring(0, 12)}...";

    return name;
  }

  String getScore() {
    return "$score/100 Rating";
  }

  bool hasProblems() {
    return allergies.isNotEmpty || intolerances.isNotEmpty || diseases.isNotEmpty || medicalRestrictions.isNotEmpty;
  }
}
