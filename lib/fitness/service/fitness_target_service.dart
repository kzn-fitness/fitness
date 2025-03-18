import 'package:fitness_app/fitness/model/FitnessTarget.dart';

enum HeightUnit { cm, ft }

enum WeightUnit { kg, lb }

enum Gender { male, female }

enum Goal {
  getFitter,
  gainWeight,
  loseWeight,
  buildingMuscles,
  improvingEndurance,
  other
}

class FitnessTargetService {
  // Calculate BMR
  static double calculateBMR(
      double weight, double height, int age, Gender gender) {
    if (gender == Gender.male) {
      return 10 * weight + 6.25 * height - 5 * age + 5;
    } else {
      return 10 * weight + 6.25 * height - 5 * age - 161;
    }
  }

  // Convert height to cm
  static double convertHeightToCm(double height, HeightUnit unit) {
    if (unit == HeightUnit.ft) {
      return height * 30.48;
    } else {
      return height; // Assume it's already in cm
    }
  }

  // Convert weight to kg
  static double convertWeightToKg(double weight, WeightUnit unit) {
    if (unit == WeightUnit.lb) {
      return weight * 0.453592;
    } else {
      return weight; // Assume it's already in kg
    }
  }

  // Calculate targets for multiple goals
  static FitnessTarget calculateTargets(
    List<Goal> goals, // Change to List of Goals
    int age,
    double height,
    double weight,
    Gender gender,
    HeightUnit heightUnit,
    WeightUnit weightUnit,
  ) {
    double stepTarget = 0;
    double caloriesBurnTarget = 0;
    double sleepTarget = 8; // Default sleep target is 7-9 hours

    // Convert height and weight to appropriate units (cm, kg)
    height = convertHeightToCm(height, heightUnit);
    weight = convertWeightToKg(weight, weightUnit);

    // BMR Calculation
    double bmr = calculateBMR(weight, height, age, gender);

    // Iterate over the list of selected goals
    for (Goal goal in goals) {
      switch (goal) {
        case Goal.getFitter:
          if (age >= 18 && age <= 40) {
            stepTarget += 8000 + ((height - 150) * 20);
            caloriesBurnTarget += bmr * 1.4;
          } else if (age >= 41 && age <= 60) {
            stepTarget += 7000 + ((height - 150) * 15);
            caloriesBurnTarget += bmr * 1.3;
          } else {
            stepTarget += 6000 + ((height - 150) * 10);
            caloriesBurnTarget += bmr * 1.2;
          }
          break;

        case Goal.gainWeight:
          if (age >= 18 && age <= 40) {
            stepTarget += 5000 + ((height - 150) * 10);
            caloriesBurnTarget += bmr * 1.2;
          } else if (age >= 41 && age <= 60) {
            stepTarget += 4500 + ((height - 150) * 8);
            caloriesBurnTarget += bmr * 1.2;
          } else {
            stepTarget += 4000 + ((height - 150) * 5);
            caloriesBurnTarget += bmr * 1.1;
          }
          break;

        case Goal.loseWeight:
          if (age >= 18 && age <= 40) {
            stepTarget += 10000 + ((height - 150) * 30);
            caloriesBurnTarget += bmr * 1.5;
          } else if (age >= 41 && age <= 60) {
            stepTarget += 9000 + ((height - 150) * 25);
            caloriesBurnTarget += bmr * 1.4;
          } else {
            stepTarget += 7000 + ((height - 150) * 20);
            caloriesBurnTarget += bmr * 1.3;
          }
          break;

        case Goal.buildingMuscles:
          if (age >= 18 && age <= 40) {
            stepTarget += 6000 + ((height - 150) * 15);
            caloriesBurnTarget += bmr * 1.6;
          } else if (age >= 41 && age <= 60) {
            stepTarget += 5500 + ((height - 150) * 12);
            caloriesBurnTarget += bmr * 1.5;
          } else {
            stepTarget += 5000 + ((height - 150) * 10);
            caloriesBurnTarget += bmr * 1.4;
          }
          break;

        case Goal.improvingEndurance:
          if (age >= 18 && age <= 40) {
            stepTarget += 12000 + ((height - 150) * 40);
            caloriesBurnTarget += bmr * 1.8;
          } else if (age >= 41 && age <= 60) {
            stepTarget += 10000 + ((height - 150) * 35);
            caloriesBurnTarget += bmr * 1.6;
          } else {
            stepTarget += 8000 + ((height - 150) * 25);
            caloriesBurnTarget += bmr * 1.4;
          }
          break;

        case Goal.other:
          stepTarget += 6000 + ((height - 150) * 10);
          caloriesBurnTarget += bmr * 1.3;
          break;
      }
    }

    // Return the calculated targets
    return FitnessTarget(
        stepTarget: stepTarget,
        caloriesBurnTarget: caloriesBurnTarget,
        sleepTarget: sleepTarget);
  }
}
