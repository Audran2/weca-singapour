class StepOneData {
  static final Map<int, List<Map<String, String>>> _stepItems = {
    1: [
      {"title": "Animal proteins", "image": "assets/images/allergies/animal_proteins.webp"},
      {"title": "Cereals and gluten", "image": "assets/images/allergies/cereals_and_gluten.webp"},
      {"title": "Pulses and seeds", "image": "assets/images/allergies/pulses_and_seeds.webp"},
      {"title": "Dried nuts", "image": "assets/images/allergies/dried_nuts.webp"},
      {"title": "Fruit and vegetables", "image": "assets/images/allergies/fruit_and_vegetables.webp"},
      {"title": "Spices and condiments", "image": "assets/images/allergies/spices_and_condiments.webp"},
    ],
    2: [
      {"title": "Gluten intolerance", "image": "assets/images/intolerance/gluten_intolerance.webp"},
      {"title": "Lactose intolerance", "image": "assets/images/intolerance/lactose_intolerance.webp"},
      {"title": "Sorbitol intolerance", "image": "assets/images/intolerance/sorbitol_intolerance.webp"},
      {"title": "Soy intolerance", "image": "assets/images/intolerance/soy_intolerance.webp"},
      {"title": "Histamine intolerance", "image": "assets/images/intolerance/histamine_intolerance.webp"},
      {"title": "Fructose intolerance", "image": "assets/images/intolerance/fructose_intolerance.webp"},
    ],
    3: [
      {"title": "Diabetes (Type 1 or Type 2)", "image": "assets/images/disease/diabetes_type_1_or_type_2.webp"},
      {"title": "Hypertension", "image": "assets/images/disease/hypertension.webp"},
      {"title": "Celiac disease", "image": "assets/images/disease/celiac_disease.webp"},
    ],
    4: [
      {"title": "Sodium and saturated fat reduction", "image": "assets/images/medical_restrictions/sodium_and_saturated_fat_reduction.webp"},
      {"title": "Low FODMAP diet", "image": "assets/images/medical_restrictions/low_fodmap_diet.webp"},
      {"title": "Added sugar reduction", "image": "assets/images/medical_restrictions/added_sugar_reduction.webp"},
    ],
  };

  static List<Map<String, String>> getItemsForStep(int step) {
    return _stepItems[step] ?? [];
  }
}
