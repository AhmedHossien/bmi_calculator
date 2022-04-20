import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'btn_bmi.dart';
import 'calc_brain.dart';
import 'icon_content.dart';
import 'result_bmi.dart';
import 'reusable_card.dart';

enum Gender { male, female }

const Color activeColor = Color(0xFF0c1043);
const Color inActiveColor = Color(0xFF1D1E33);
const Color pink = Color(0xFFff43d6);
const kLabelTextStyle = TextStyle(color: Colors.white, fontSize: 25);
const kGreenTextStyle = TextStyle(color: Colors.green, fontSize: 25);

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int we = 60;
  int ag = 30;
  int height = 125;
  Color maleNow = inActiveColor;
  Color femaleNow = inActiveColor;
  late Gender selectedGender = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF0A0E21),
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
          centerTitle: true,
          backgroundColor: const Color(0xFF0A0E21),
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                        colour: selectedGender == Gender.male
                            ? activeColor
                            : inActiveColor,
                        childCard: const IconContent(
                          ico: FontAwesomeIcons.person,
                          txt: 'Male',
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        colour: selectedGender == Gender.female
                            ? activeColor
                            : inActiveColor,
                        childCard: const IconContent(
                          ico: FontAwesomeIcons.personDress,
                          txt: 'Female',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        colour: inActiveColor,
                        childCard: Column(
                          children: <Widget>[
                            const Expanded(
                              child: Center(
                                child: Text(
                                  "Height",
                                  style: kLabelTextStyle,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  "$height cm",
                                  style: kLabelTextStyle,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Slider(
                                  value: height.toDouble(),
                                  activeColor: pink,
                                  onChanged: (double value) {
                                    setState(() {
                                      height = value.round();
                                    });
                                  },
                                  min: 0,
                                  max: 250,
                                ),
                              ),
                            )
                          ],
                        ),
                        onPress: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        colour: inActiveColor,
                        childCard: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            const Expanded(
                              child: Center(
                                child: Text(
                                  "Weight",
                                  style: kLabelTextStyle,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  "$we",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    FloatingActionButton(
                                        heroTag: "btn1",
                                        onPressed: () {
                                          setState(() {
                                            we--;
                                          });
                                        },
                                        mini: true,
                                        backgroundColor: Colors.white30,
                                        child: const Icon(Icons.remove)),
                                    FloatingActionButton(
                                        heroTag: "btn2",
                                        onPressed: () {
                                          setState(() {
                                            we++;
                                          });
                                        },
                                        mini: true,
                                        backgroundColor: Colors.white30,
                                        child: const Icon(Icons.add)),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        onPress: () {},
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        colour: inActiveColor,
                        childCard: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            const Expanded(
                              child: Center(
                                child: Text(
                                  "Age",
                                  style: kLabelTextStyle,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  "$ag",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    FloatingActionButton(
                                        heroTag: "btn3",
                                        onPressed: () {
                                          setState(() {
                                            ag--;
                                          });
                                        },
                                        mini: true,
                                        backgroundColor: Colors.white30,
                                        child: const Icon(Icons.remove)),
                                    FloatingActionButton(
                                        heroTag: "btn4",
                                        onPressed: () {
                                          setState(() {
                                            ag++;
                                          });
                                        },
                                        mini: true,
                                        backgroundColor: Colors.white30,
                                        child: const Icon(
                                            Icons.add)), /*   child: Icon(),*/
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        onPress: () {},
                      ),
                    ),
                  ],
                ),
              ),
              But(
                btnTitle: "Calculate Bmi",
                function: () {
                  Brain calc = Brain(height, we);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Result(
                      bmiCalc: calc.bmiCalc(),
                      getResult: calc.getResult(),
                      getDetails: calc.getDetails(),
                    );
                  }));
                },
              )
            ],
          ),
        ));
  }
}
