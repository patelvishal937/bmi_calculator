import 'package:bmi_calculator/constant.dart';
import 'package:flutter/material.dart';
import 'inputpage.dart';
import 'reusable_card.dart';
import 'bottombutton.dart';

class Results extends StatelessWidget {
  Results(
      {required this.bmiResult,
      required this.resultText,
      required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATION'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: ktitlestyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: reusable_card(
              Ontap: () {},
              colors: Active_color,
              card_child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: kResultstyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBMItextstyle,
                  ),
                  Text(
                    interpretation,
                    style: kbmibodytextstyle,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          BottomButton(
              buttonTitle: 'RE-CALCULATE',
              onTap: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
