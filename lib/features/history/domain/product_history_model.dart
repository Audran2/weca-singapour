import 'package:easy_localization/easy_localization.dart';

class ProductHistory {
  final String name;
  final String score;
  final List<String> allergies;
  final List<String> preferences;
  final List<String> intolerances;
  final List<String> dangerousComponents;

  ProductHistory({
    required this.name,
    required this.score,
    required this.allergies,
    required this.preferences,
    required this.intolerances,
    required this.dangerousComponents,
  });

  String getProductScore() {
    return "${"history.product.score".tr()} : $score/100";
  }

  String getIntolerances() {
    if (intolerances.isNotEmpty) {
      return "${"history.product.intolerance".tr()} : ${intolerances.join(", ")}";
    }

    return "history.product.match".tr();
  }

  String getAllergies() {
    return "${"history.product.allergies".tr()} : ${allergies.join(", ")}";
  }
}