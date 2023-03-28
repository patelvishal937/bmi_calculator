import 'package:flutter/material.dart';
import 'inputpage.dart';

void main() {
  runApp(const Bmi_calculator());
}

class Bmi_calculator extends StatefulWidget {
  const Bmi_calculator({super.key});

  @override
  State<Bmi_calculator> createState() => _Bmi_calculatorState();
}

class _Bmi_calculatorState extends State<Bmi_calculator> {
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          color: Color(
            0xFF0A0E21,
          ),
        ),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
      ),
      home: inputpage(),
    );
  }
}
