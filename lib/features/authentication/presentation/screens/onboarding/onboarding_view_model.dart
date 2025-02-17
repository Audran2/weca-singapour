import 'package:flutter/material.dart';

class OnboardingViewModel with ChangeNotifier {
  final PageController pageController = PageController();
  int currentStepIndex = 1;
  int currentSubStep = 1;
  String dietaryPreference = '';
  String nutriGrade = '';
  String ecoGrade = '';

  final Set<String> selectedAllergies = {};
  final Set<String> selectedIntolerances = {};
  final Set<String> selectedDiseases = {};
  final Set<String> selectedMedicalRestrictions = {};

  Future<void> goToNextStep() async {
    if (currentSubStep < 4) {
      currentSubStep++;
    } else if (currentStepIndex < 4) {
      currentStepIndex++;
      await pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    notifyListeners();
  }

  Future<void> goToPreviousStep() async {
    print('currentSubStep: $currentSubStep');
    print('currentStepIndex: $currentStepIndex');
    if (currentStepIndex == 1 && currentSubStep > 1) {
      currentSubStep--;
    } else if (currentStepIndex > 1) {
      currentStepIndex--;
      await pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    notifyListeners();
  }


  void setDietaryPreference(String preference) {
    dietaryPreference = preference;
    notifyListeners();
  }

  void setNutriGrade(String grade) {
    nutriGrade = grade;
    notifyListeners();
  }

  void setEcoGrade(String grade) {
    ecoGrade = grade;
    notifyListeners();
  }

  void toggleAllergySelection(String item) {
    _toggleSelection(selectedAllergies, item);
  }

  void toggleIntoleranceSelection(String item) {
    _toggleSelection(selectedIntolerances, item);
  }

  void toggleDiseaseSelection(String item) {
    _toggleSelection(selectedDiseases, item);
  }

  void toggleMedicalRestrictionSelection(String item) {
    _toggleSelection(selectedMedicalRestrictions, item);
  }

  void _toggleSelection(Set<String> selectedSet, String item) {
    if (selectedSet.contains(item)) {
      selectedSet.remove(item);
    } else {
      selectedSet.add(item);
    }
    notifyListeners();
  }

  bool isItemSelected(int step, String title) {
    switch (step) {
      case 1:
        return selectedAllergies.contains(title);
      case 2:
        return selectedIntolerances.contains(title);
      case 3:
        return selectedDiseases.contains(title);
      case 4:
        return selectedMedicalRestrictions.contains(title);
      default:
        return false;
    }
  }

  void toggleSelection(int step, String title) {
    switch (step) {
      case 1:
        toggleAllergySelection(title);
        break;
      case 2:
        toggleIntoleranceSelection(title);
        break;
      case 3:
        toggleDiseaseSelection(title);
        break;
      case 4:
        toggleMedicalRestrictionSelection(title);
        break;
    }
  }


  Future<void> sendDataToApi() async {
    //TODO à renommer et relier à l'API
  }
}
