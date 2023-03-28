import 'package:flutter/material.dart';
import 'inputpage.dart';
import 'dart:math';

class CalculatorBrain {
  CalculatorBrain ({required this.height,required this.weight});
   int height = 180;
   int weight = 20;
  double _bmi = 0;

  String calculateBMI() {
    double _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getresult() {
    if (_bmi >= 25) {
      return 'overweight';
    } else if (_bmi > 18.5) {
      return 'normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight, Try to exersize more';
    } else if (_bmi > 18.5) {
      return 'You have normal body weight';
    } else {
      return 'You have lower than your body weight';
    }
  }
}

