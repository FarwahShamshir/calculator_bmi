import 'package:flutter/material.dart';
import 'input_page.dart';


void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
      theme: ThemeData.light().copyWith(
        primaryColor: Color(0xFF478CCF),
        scaffoldBackgroundColor: Color(0xFF478CCF),
      ),

    );
  }


}
