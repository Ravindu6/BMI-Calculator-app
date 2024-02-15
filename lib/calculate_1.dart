import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bmicontroller.dart';
import 'infoscreen.dart';

class CalculateScreen extends StatelessWidget {
  final BMIController _bmiController = Get.put(BMIController());
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  CalculateScreen({Key? key}) : super(key: key);

  void clearInputsAndResult(BMIController bmiController) {
    _heightController.clear();
    _weightController.clear();
    bmiController.height.value = 0.0;
    bmiController.weight.value = 0.0;
    bmiController.bmiResult.value = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' BMI Calculator'),
        backgroundColor: const Color.fromARGB(255, 136, 160, 180),
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              Get.to(InfoScreen());
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromARGB(255, 18, 5, 46),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _heightController,
                  onChanged: (value) =>
                      _bmiController.height.value = double.tryParse(value) ?? 0.0,
                  decoration: const InputDecoration(
                    labelText: 'Height (in meters)',
                    border: OutlineInputBorder(),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _weightController,
                  onChanged: (value) =>
                      _bmiController.weight.value = double.tryParse(value) ?? 0.0,
                  decoration: const InputDecoration(
                    labelText: 'Weight (in kilograms)',
                    border: OutlineInputBorder(),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_bmiController.height.value > 0 &&
                            _bmiController.weight.value > 0) {
                          _bmiController.calculateBMI();
                          Get.to(InfoScreen());
                        } else {
                          // Show a message or handle invalid input
                          if (kDebugMode) {
                            print('Please enter valid height and weight.');
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Colors.pink,
                        padding: const EdgeInsets.all(16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 3,
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        side: const BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                        minimumSize: const Size(150, 50),
                      ),
                      child: const Text('Calculate'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        clearInputsAndResult(_bmiController);
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Colors.pink,
                        padding: const EdgeInsets.all(16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 3,
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        side: const BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                        minimumSize: const Size(150, 50),
                      ),
                      child: const Text('Clear'),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Obx(() {
                  final bmiResult = _bmiController.bmiResult.value;

                  return Container(
                    padding: const EdgeInsets.all(16.0),
                    margin: const EdgeInsets.symmetric(vertical: 16.0),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 136, 160, 180),
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                          color: const Color.fromARGB(255, 229, 240, 248),
                          width: 2.0),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'BMI Result',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 241, 236, 236),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.pink, width: 2.0),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            bmiResult.toStringAsFixed(2),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 241, 238, 238),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
