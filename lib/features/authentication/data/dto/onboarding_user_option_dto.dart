class OnboardingUserOptionDTO {
  final List<String> allergies;
  final List<String> preferences;
  final List<Map<String, String>> options;
  final List<String> intolerances;
  final List<String> diseases;
  final List<String> medicalRestrictions;

  OnboardingUserOptionDTO({
    required this.allergies,
    required this.preferences,
    required this.options,
    required this.intolerances,
    required this.diseases,
    required this.medicalRestrictions,
  });

  Map<String, dynamic> toJson() {
    return {
      'allergies': allergies,
      'preferences': preferences,
      'options': options,
      'intolerances': intolerances,
      'diseases': diseases,
      'medical_restrictions': medicalRestrictions,
    };
  }
}
