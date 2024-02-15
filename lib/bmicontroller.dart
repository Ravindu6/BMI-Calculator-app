import 'dart:ui';

import 'package:get/get.dart';

class BMIController extends GetxController {
  var height = 0.0.obs;
  var weight = 0.0.obs;
  var bmiResult = 0.0.obs;
  var category = ''.obs;

  // Set a background color for the BMIController
  var backgroundColor = const Color.fromARGB(255, 18, 5, 46).obs;

  // Use this box to display the category
  var categoryBox = ''.obs;

  void calculateBMI() {
    // BMI Calculation Formula: BMI = weight (kg) / (height (m) * height (m))
    if (height.value > 0 && weight.value > 0) {
      double heightInMeters = height.value;
      double weightInKilograms = weight.value;

      double bmi = weightInKilograms / (heightInMeters * heightInMeters);
      bmiResult.value = bmi;

      // Categorize BMI
      if (bmi < 16) {
        category.value = 'Severe undernourishment';
      } else if (bmi >= 16 && bmi < 16.9) {
        category.value = 'Medium undernourishment';
      } else if (bmi >= 17 && bmi < 18.4) {
        category.value = 'Slight undernourishment';
      } else if (bmi >= 18.5 && bmi < 24.9) {
        category.value = 'Normal nutrition state';
      } else if (bmi >= 25 && bmi < 29.9) {
        category.value = 'Overweight';
      } else if (bmi >= 30 && bmi < 39.9) {
        category.value = 'Obesity';
      } else if (bmi > 40) {
        category.value = 'Pathological obesity';
      }
      
      // Set the categoryBox value for UI
      categoryBox.value = category.value;
    } else {
      // Handle invalid input (height or weight <= 0)
      bmiResult.value = 0.0;
      category.value = 'Invalid Input';

      // Set the categoryBox value for UI
      categoryBox.value = category.value;
    }
  }
}
