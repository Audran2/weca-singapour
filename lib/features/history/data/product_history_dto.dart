import '../domain/product_history_model.dart';

class ProductHistoryDTO {
  final String name;
  final String score;
  final List<String> allergies;
  final List<String> preferences;
  final List<String> intolerances;
  final List<String> dangerousComponents;

  ProductHistoryDTO({
    required this.name,
    required this.score,
    required this.allergies,
    required this.preferences,
    required this.intolerances,
    required this.dangerousComponents,
  });

  factory ProductHistoryDTO.fromJson(Map<String, dynamic> json) {
    return ProductHistoryDTO(
      name: json['name'],
      score: json['score'],
      allergies: (json['allergies'] as List<dynamic>).map((dynamic e) => e["name"] as String).toList(),
      preferences: (json['preferences'] as List<dynamic>).map((dynamic e) => e["name"] as String).toList(),
      intolerances: (json['intolerances'] as List<dynamic>).map((dynamic e) => e["name"] as String).toList(),
      dangerousComponents: (json['dangerousComponents'] as List<dynamic>).map((dynamic e) => e["name"] as String).toList(),
    );
  }

  ProductHistory toDomain() {
    return ProductHistory(
      name: name,
      score: score,
      allergies: allergies,
      preferences: preferences,
      intolerances: intolerances,
      dangerousComponents: dangerousComponents,
    );
  }
}
