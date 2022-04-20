import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';

import 'btn_bmi.dart';
import 'input.dart';
import 'reusable_card.dart';

class Result extends StatelessWidget {
  const Result(
      {Key? key,
      required this.bmiCalc,
      required this.getResult,
      required this.getDetails})
      : super(key: key);

  final String bmiCalc;
  final String getResult;
  final String getDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
                child: Container(
                    margin: const EdgeInsets.all(8),
                    child: const Center(
                        child: Text("Your Result", style: kLabelTextStyle)))),
            Expanded(
              flex: 5,
              child: ReusableCard(
                childCard: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(getResult,
                          style: const TextStyle(
                              fontSize: 25,
                              color: Colors.green,
                              fontWeight: FontWeight.bold)),
                      Text(bmiCalc,
                          style: const TextStyle(
                              fontSize: 50,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      Text(getDetails,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                ),
                colour: inActiveColor,
                onPress: () {},
              ),
            ),
            But(
              btnTitle: "Re-Calculate",
              function: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
