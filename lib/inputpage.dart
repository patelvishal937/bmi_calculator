// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names

import 'package:bmi_calculator/Result.dart';
import 'package:bmi_calculator/bottombutton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Child_card.dart';
import 'reusable_card.dart';
import 'constant.dart';
import 'Result.dart';
import 'calculator_brain.dart';

enum Gender { Male, Female }

class inputpage extends StatefulWidget {
  const inputpage({super.key});

  @override
  State<inputpage> createState() => _inputpageState();
}

class _inputpageState extends State<inputpage> {
  Gender selected_gender = Gender.Male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI_CALCULATOR'),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: reusable_card(
                  Ontap: () {
                    setState(() {
                      print('Male card is clicked');
                      selected_gender = Gender.Male;
                    });
                  },
                  colors: selected_gender == Gender.Male
                      ? Active_color
                      : Inactive_color,
                  card_child: inputfield(
                    Name: 'Male',
                    iconData: FontAwesomeIcons.mars,
                  ),
                ),
              ),
              Expanded(
                  child: reusable_card(
                Ontap: () {
                  setState(() {
                    print('Female card is clicked');
                    selected_gender = Gender.Female;
                  });
                },
                colors: selected_gender == Gender.Female
                    ? Active_color
                    : Inactive_color,
                card_child: inputfield(
                  Name: 'FeMale',
                  iconData: FontAwesomeIcons.venus,
                ),
              ))
            ],
          ),
        ),
        Expanded(
          child: reusable_card(
            Ontap: () {},
            colors: Active_color,
            card_child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: Number_textstyle,
                    ),
                    Text(
                      'cm',
                      style: labeltextstyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Color(0xFF8D8E98),
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0X29FFEB1555).withOpacity(0.1),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 280,
                    onChanged: (double newvalue) {
                      setState(() {
                        height = newvalue.round();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: reusable_card(
                  Ontap: () {},
                  colors: Active_color,
                  card_child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Weight',
                        style: labeltextstyle,
                      ),
                      Text(
                        weight.toString(),
                        style: Number_textstyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: reusable_card(
                  Ontap: () {},
                  colors: Active_color,
                  card_child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Age',
                        style: labeltextstyle,
                      ),
                      Text(
                        age.toString(),
                        style: Number_textstyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        BottomButton(
          buttonTitle: 'Calculate',
          onTap: () {
            CalculatorBrain calc =
                CalculatorBrain(height: height, weight: weight);
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Results(
                        bmiResult: calc.calculateBMI(),
                        resultText: calc.getresult(),
                        interpretation: calc.getInterpretation(),
                      )),
            );
          },
        )
      ]),
    );
  }
}

// void updatecolor(Enum selected_gender) {
//   if (selected_gender == Gender.Male) {
//     if (malecardcolor == Inactive_color) {
//       malecardcolor = Active_color;
//       femalecardcolor = Inactive_color;
//     } else {
//       malecardcolor = Inactive_color;
//     }
//     malecardcolor == Inactive_color
//         ? malecardcolor = Active_color
//         : malecardcolor = Inactive_color;
//   }
//   if (selected_gender == Gender.Female) {
//     if (femalecardcolor == Inactive_color) {
//       femalecardcolor = Active_color;
//       malecardcolor = Inactive_color;
//     } else {
//       femalecardcolor = Inactive_color;
//     }
//   }
// }

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onPressed});
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: FaIcon(icon),
      onPressed: () => onPressed(),
      shape: CircleBorder(),
      elevation: 0.0,
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
    );
  }
}
