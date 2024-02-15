import 'package:bmi_calculator_1/bmicontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'calculate_1.dart';
import 'infoscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: CalculateScreen(),
      getPages: [
        GetPage(name: '/calculate', page: () => CalculateScreen()),
        GetPage(name: '/info', page: () => InfoScreen()),
      ],
      initialBinding: BindingsBuilder(() {
        Get.put(BMIController());
      }),
    );
  }
}


