import 'dart:math';

class CalculatorBrain{
  CalculatorBrain({required this.height,required this.weight});
  final int height;
  final int weight;
  late double bmi;

  String calculateBMI(){
    bmi = weight/ pow(height/100,2);
    return bmi.toStringAsFixed(1);
  }
  String getResult(){
    if (bmi >= 25){
      return 'overweight';
    } else if (bmi >= 18.5){
      return 'Normal';
    }else{
      return ' overweight';
    }
  }
  String getInterpretation(){
    if (bmi >= 25){
      return 'you have higher tha normal body weight , do exercise';
    } else if (bmi >= 18.5){
      return 'You ave normal body weight';
    }else{
      return ' you have lower tha normal body weight , more eat';
    }


  }


}