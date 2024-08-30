import 'package:fs/Container_file.dart';
import 'package:fs/constantFile.dart';
import 'package:flutter/material.dart';



class ResultScreen extends StatelessWidget {
  const ResultScreen({
    Key? key,
    required this.bmiResult,
    required this.resultText,
    required this.interpretation,
  }) : super(key: key);

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
      backgroundColor: (Color(0xFFD7DFA3)),
        title: Text('BMI Result'),
      ),
      body: Stack(
        children: [
        // Background image with opacity
        Opacity(
        opacity: 0.4,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/fff.jpg"), // Replace with your image path
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),




      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              child: Text(
                'Your Result',
                style: kTitleStyleS2,
              ),
            ),
          ),
          Expanded(
            child: RepeatContainerCode(
              onPressed: () {},
              color: activeColor,
              cardWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(resultText, style: kResultText),
                  SizedBox(
                    height: 40,
                  ),
                  Text(bmiResult, style: kResultText),
                  SizedBox(
                    height: 40,
                  ),
                  Text(interpretation, style: kBodyTextStyle),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "ReCalculate",
                      style: kLargeButtonStyle,
                    ),
                  ),
                ),
              ),
              color: Color(0xFFD7DFA3),
              margin: EdgeInsets.only(top: 150.0),
              width: double.infinity,
              height: 80.0,
            ),
          ),
        ],
      ),]));
  }
}
