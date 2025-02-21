import 'package:easy_localization/easy_localization.dart';

class BoardingStepData {
  static final Map<int, List<Map<String, String>>> _stepItems = {
    1: [
      {
        "title":
            "authentication.boarding.step1.subStep1.list_data.animal_proteins.title"
                .tr(),
        "image": "assets/images/allergies/animal_proteins.webp",
        "description":
            "authentication.boarding.step1.subStep1.list_data.animal_proteins.description"
                .tr()
      },
      {
        "title":
            "authentication.boarding.step1.subStep1.list_data.cereals_and_gluten.title"
                .tr(),
        "image": "assets/images/allergies/cereals_and_gluten.webp",
        "description":
            "authentication.boarding.step1.subStep1.list_data.cereals_and_gluten.description"
                .tr()
      },
      {
        "title":
            "authentication.boarding.step1.subStep1.list_data.pulses_and_seeds.title"
                .tr(),
        "image": "assets/images/allergies/pulses_and_seeds.webp",
        "description":
            "authentication.boarding.step1.subStep1.list_data.pulses_and_seeds.description"
                .tr()
      },
      {
        "title":
            "authentication.boarding.step1.subStep1.list_data.dried_nuts.title"
                .tr(),
        "image": "assets/images/allergies/dried_nuts.webp",
        "description":
            "authentication.boarding.step1.subStep1.list_data.dried_nuts.description"
                .tr()
      },
      {
        "title":
            "authentication.boarding.step1.subStep1.list_data.fruit_and_vegetables.title"
                .tr(),
        "image": "assets/images/allergies/fruit_and_vegetables.webp",
        "description":
            "authentication.boarding.step1.subStep1.list_data.fruit_and_vegetables.description"
                .tr()
      },
      {
        "title":
            "authentication.boarding.step1.subStep1.list_data.spices_and_condiments.title"
                .tr(),
        "image": "assets/images/allergies/spices_and_condiments.webp",
        "description":
            "authentication.boarding.step1.subStep1.list_data.spices_and_condiments.description"
                .tr()
      },
    ],
    2: [
      {
        "title":
            "authentication.boarding.step1.subStep2.list_data.gluten_intolerance.title"
                .tr(),
        "image": "assets/images/intolerance/gluten_intolerance.webp",
        "description":
            "authentication.boarding.step1.subStep2.list_data.gluten_intolerance.description"
                .tr()
      },
      {
        "title":
            "authentication.boarding.step1.subStep2.list_data.lactose_intolerance.title"
                .tr(),
        "image": "assets/images/intolerance/lactose_intolerance.webp",
        "description":
            "authentication.boarding.step1.subStep2.list_data.lactose_intolerance.description"
                .tr()
      },
      {
        "title":
            "authentication.boarding.step1.subStep2.list_data.sorbitol_intolerance.title"
                .tr(),
        "image": "assets/images/intolerance/sorbitol_intolerance.webp",
        "description":
            "authentication.boarding.step1.subStep2.list_data.sorbitol_intolerance.description"
                .tr()
      },
      {
        "title":
            "authentication.boarding.step1.subStep2.list_data.soy_intolerance.title"
                .tr(),
        "image": "assets/images/intolerance/soy_intolerance.webp",
        "description":
            "authentication.boarding.step1.subStep2.list_data.soy_intolerance.description"
                .tr()
      },
      {
        "title":
            "authentication.boarding.step1.subStep2.list_data.histamine_intolerance.title"
                .tr(),
        "image": "assets/images/intolerance/histamine_intolerance.webp",
        "description":
            "authentication.boarding.step1.subStep2.list_data.histamine_intolerance.description"
                .tr()
      },
      {
        "title":
            "authentication.boarding.step1.subStep2.list_data.fructose_intolerance.title"
                .tr(),
        "image": "assets/images/intolerance/fructose_intolerance.webp",
        "description":
            "authentication.boarding.step1.subStep2.list_data.fructose_intolerance.description"
                .tr()
      },
    ],
    3: [
      {
        "title":
            "authentication.boarding.step1.subStep3.list_data.diabetes.title"
                .tr(),
        "image": "assets/images/disease/diabetes_type_1_or_type_2.webp",
        "description":
            "authentication.boarding.step1.subStep3.list_data.diabetes.description"
                .tr()
      },
      {
        "title":
            "authentication.boarding.step1.subStep3.list_data.hypertension.title"
                .tr(),
        "image": "assets/images/disease/hypertension.webp",
        "description":
            "authentication.boarding.step1.subStep3.list_data.hypertension.description"
                .tr()
      },
      {
        "title":
            "authentication.boarding.step1.subStep3.list_data.celiac_disease.title"
                .tr(),
        "image": "assets/images/disease/celiac_disease.webp",
        "description":
            "authentication.boarding.step1.subStep3.list_data.celiac_disease.description"
                .tr()
      },
    ],
    4: [
      {
        "title":
            "authentication.boarding.step1.subStep4.list_data.sodium_and_saturated_fat_reduction.title"
                .tr(),
        "image":
            "assets/images/medical_restrictions/sodium_and_saturated_fat_reduction.webp",
        "description":
            "authentication.boarding.step1.subStep4.list_data.sodium_and_saturated_fat_reduction.description"
                .tr()
      },
      {
        "title":
            "authentication.boarding.step1.subStep4.list_data.low_fodmap_diet.title"
                .tr(),
        "image": "assets/images/medical_restrictions/low_fodmap_diet.webp",
        "description":
            "authentication.boarding.step1.subStep4.list_data.low_fodmap_diet.description"
                .tr()
      },
      {
        "title":
            "authentication.boarding.step1.subStep4.list_data.added_sugar_reduction.title"
                .tr(),
        "image":
            "assets/images/medical_restrictions/added_sugar_reduction.webp",
        "description":
            "authentication.boarding.step1.subStep4.list_data.added_sugar_reduction.description"
                .tr()
      },
    ],
  };

  static final List<String> dietaryOptions = [
    'authentication.boarding.step2.list_data.vegetarian'.tr(),
    'authentication.boarding.step2.list_data.vegan'.tr(),
    'authentication.boarding.step2.list_data.pescetarian'.tr(),
    'authentication.boarding.step2.list_data.flexitarian'.tr(),
    'authentication.boarding.step2.list_data.gluten_free'.tr(),
    'authentication.boarding.step2.list_data.lactose_free'.tr(),
    'authentication.boarding.step2.list_data.halal'.tr(),
    'authentication.boarding.step2.list_data.kosher'.tr(),
    'authentication.boarding.step2.list_data.ketogenic'.tr(),
    'authentication.boarding.step2.list_data.paleo'.tr(),
  ];

  static List<Map<String, String>> getItemsForStep(int step) {
    return _stepItems[step] ?? [];
  }
}
