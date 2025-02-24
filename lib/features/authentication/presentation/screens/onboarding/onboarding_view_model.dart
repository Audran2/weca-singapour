import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../../core/data/http/token_provider.dart';
import '../../../../../core/data/result.dart';
import '../../../../../core/services/top_dialog_services.dart';
import '../../../data/dto/onboarding_user_option_dto.dart';
import '../../../data/repository/authentication_remote_repository.dart';

class OnboardingViewModel with ChangeNotifier {
  final BuildContext context;

  OnboardingViewModel({required this.context});

  final PageController pageController = PageController();
  final PageController pageOneController = PageController();
  final PageController pageThreeController = PageController();

  ValueNotifier<bool> isLoading = ValueNotifier(false);

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
      if (boardingStepIndex == 1) {
        boardingSubStepOneIndex = 4;
      }
      await pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      if (boardingStepIndex == 1) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (pageOneController.hasClients) {
            pageOneController.jumpToPage(3);
          }
        });
      }
    }
    notifyListeners();
  }

  void goToStepOneSubStep(int subStep) {
    boardingSubStepOneIndex = subStep;
    pageOneController.animateToPage(subStep - 1,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    notifyListeners();
  }

  void onMainButtonPressed() {
    if (boardingStepIndex == 3 && boardingSubStepThreeIndex == 2) {
      updateUserInfos();
    } else {
      goToNextStep();
    }
  }

  double get progress {
    const int totalSteps = 7;
    final double currentStep = boardingStepIndex +
        (boardingSubStepOneIndex - 1) +
        (boardingSubStepThreeIndex - 1);

    return currentStep / totalSteps;
  }

  String get progressText {
    if (boardingStepIndex == 3) {
      if (boardingSubStepThreeIndex == 2) {
        return "authentication.boarding.action_button.start".tr();
      }
      return "authentication.boarding.action_button.last".tr();
    }
    return "authentication.boarding.action_button.next".tr();
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

  bool isItemSelected(int step, String value) {
    switch (step) {
      case 1:
        return selectedAllergies.contains(value);
      case 2:
        return selectedIntolerances.contains(value);
      case 3:
        return selectedDiseases.contains(value);
      case 4:
        return selectedMedicalRestrictions.contains(value);
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

  Future<void> updateUserInfos() async {
    if (isLoading.value) return;

    isLoading.value = true;

    try {
      final OnboardingUserOptionDTO userOptionDTO = OnboardingUserOptionDTO(
        name: "Audran",
        allergies: selectedAllergies,
        preferences: dietaryPreferences,
        options: [
          {"name": "Nutri-Grade", "value": nutriGrade},
          {"name": "Eco-Grade", "value": ecoGrade},
        ],
        intolerances: selectedIntolerances,
        diseases: selectedDiseases,
        medicalRestrictions: selectedMedicalRestrictions,
      );

      final tokenProvider =
          Provider.of<TokenProviderNotifier>(context, listen: false);
      final repository =
          AuthenticationRemoteRepository(tokenProvider: tokenProvider);

      final Result<void> result = await repository.updateProfile(
          onboardingUserOptionDTO: userOptionDTO);

      if (result.isFailure) {
        return DialogService.showTopErrorDialog(context, result.errorMessage!);
      }

      context.goNamed('home');
    } finally {
      isLoading.value = false;
    }
  }
}
