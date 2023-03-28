import 'package:bmi_calculator/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class inputfield extends StatelessWidget {
  const inputfield({required this.iconData, required this.Name});
  final IconData iconData;
  final String Name;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 80.0,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          Name,
          style: labeltextstyle,
        ),
      ],
    );
  }
}
