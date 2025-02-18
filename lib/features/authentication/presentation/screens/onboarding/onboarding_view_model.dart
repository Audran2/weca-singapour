import 'package:flutter/material.dart';

class OnboardingViewModel with ChangeNotifier {
  final PageController pageController = PageController();
  final PageController pageOneController = PageController();
  final PageController pageThreeController = PageController();

  int boardingStepIndex = 1;
  int boardingSubStepOneIndex = 1;
  int boardingSubStepThreeIndex = 1;

  List<String> selectedAllergies = [];
  List<String> selectedIntolerances = [];
  List<String> selectedDiseases = [];
  List<String> selectedMedicalRestrictions = [];
  List<String> dietaryPreferences = [];

  String nutriGrade = '';
  String ecoGrade = '';

  Future<void> goToNextStep() async {
    if (boardingStepIndex == 1 && boardingSubStepOneIndex < 4) {
      boardingSubStepOneIndex++;
      await pageOneController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else if (boardingStepIndex == 3 && boardingSubStepThreeIndex < 2) {
      boardingSubStepThreeIndex++;
      await pageThreeController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else if (boardingStepIndex < 3) {
      boardingStepIndex++;
      await pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    notifyListeners();
  }

  Future<void> goToPreviousStep() async {
    if (boardingStepIndex == 1 && boardingSubStepOneIndex > 1) {
      boardingSubStepOneIndex--;
      await pageOneController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else if (boardingStepIndex == 3 && boardingSubStepThreeIndex > 1) {
      boardingSubStepThreeIndex--;
      await pageThreeController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else if (boardingStepIndex > 1) {
      boardingStepIndex--;
      await pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
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

  void toggleDietaryPreference(String item) {
    _toggleSelection(dietaryPreferences, item);
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

  void _toggleSelection(List<String> selectedSet, String item) {
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
