import 'dart:math';

class Brain {
  Brain(this.height, this.weight);

  final int height;
  final int weight;
  double _bmi = 0;

  String bmiCalc() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'OverWeight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getDetails() {
    if (_bmi >= 25) {
      return 'Moderate risk of developing heart disease, high blood pressure, stroke, diabetes';
    } else if (_bmi > 18.5) {
      return 'Low Risk (healthy range)';
    } else {
      return 'Risk of developing problems such as nutritional deficiency and osteoporosis';
    }
  }
}
