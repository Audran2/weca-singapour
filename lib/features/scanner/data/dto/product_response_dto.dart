import '../../domain/item_model.dart';
import '../../domain/product_id.dart';
import '../../domain/product_model.dart';

class ProductResponseDTO {
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

  ProductResponseDTO({
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

  factory ProductResponseDTO.fromJson(Map<String, dynamic> json) {
    List<Item> extractItems(List<dynamic> items) {
      return items.map((item) => Item.fromJson(item)).toList();
    }

    return ProductResponseDTO(
      id: ProductId(json['id']),
      name: json['name'],
      brand: json['brand'],
      score: json['score'],
      description: json['description'] ?? "",
      imageUrl: json['image'] ?? "https://tinasbotanicals.com/wp-content/uploads/2025/01/No-Product-Image-Available.png",
      allergies: json['allergies'] != null ? extractItems(json['allergies']) : [],
      preferences: json['preferences'] != null ? extractItems(json['preferences']) : [],
      intolerances: json['intolerances'] != null ? extractItems(json['intolerances']) : [],
      diseases: json['diseases'] != null ? extractItems(json['diseases']) : [],
      medicalRestrictions: json['medicalRestrictions'] != null ? extractItems(json['medicalRestrictions']) : [],
      ingredients: json['ingredients'] != null ? List<String>.from(json['ingredients']) : [],
      dangerousComponents: json['dangerousComponents'] != null ? extractItems(json['dangerousComponents']) : [],
    );
  }

  Product toDomain() {
    return Product(
      id: id,
      name: name,
      brand: brand,
      score: score,
      description: description,
      imageUrl: imageUrl,
      allergies: allergies,
      preferences: preferences,
      intolerances: intolerances,
      diseases: diseases,
      medicalRestrictions: medicalRestrictions,
      ingredients: ingredients,
      dangerousComponents: dangerousComponents,
    );
  }
}