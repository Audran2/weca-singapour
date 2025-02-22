import '../../domain/product_id.dart';
import '../../domain/product_model.dart';

class ProductResponseDTO {
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
    return ProductResponseDTO(
      id: ProductId(json['id']),
      name: json['name'],
      brand: json['brand'],
      score: json['score'],
      description: json['description'],
      imageUrl: json['image'],
      allergies: List<String>.from(json['allergies']),
      preferences: List<String>.from(json['preferences']),
      intolerances: List<String>.from(json['intolerances']),
      diseases: List<String>.from(json['diseases']),
      medicalRestrictions: List<String>.from(json['medical_restrictions']),
      ingredients: List<String>.from(json['ingredients']),
      dangerousComponents: List<String>.from(json['dangerous_components']),
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