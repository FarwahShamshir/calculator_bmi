import 'package:fs/constantFile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fs/Container_file.dart';
import 'IconText.dart';
import 'result.file.dart';
import 'package:fs/Calculator.File.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectGender;
  int sliderHeight = 180;
  int sliderWeight = 60;
  int sliderAge = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFD7DFA3),
        centerTitle: true,
        title: const Text(
          'BMI CALCULATOR',
          style: TextStyle(color: Colors.black),
        ),
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
      Column(children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: RepeatContainerCode(
                  onPressed: () {
                    setState(() {
                      selectGender = Gender.male;
                    });
                  },
                  color:
                  selectGender == Gender.male ? activeColor : deActiveColor,
                  cardWidget: repeatTextAndIcon(
                    iconData: FontAwesomeIcons.male,
                    label: 'Male',
                  ),
                ),
              ),
              Expanded(
                child: RepeatContainerCode(
                  onPressed: () {
                    setState(() {
                      selectGender = Gender.female;
                    });
                  },
                  color: selectGender == Gender.female
                      ? activeColor
                      : deActiveColor,
                  cardWidget: repeatTextAndIcon(
                    iconData: FontAwesomeIcons.female,
                    label: 'Female',
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: RepeatContainerCode(
            onPressed: () {},
            color: const Color(0xFFD7DFA3),
            cardWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Height',
                  style: kLabelStyle,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      sliderHeight.toString(),
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'cm',
                      style: kLabelStyle,
                    ),
                  ],
                ),
                Slider(
                  value: sliderHeight.toDouble(),
                  min: 120.0,
                  max: 220.0,
                  activeColor: Color(0xFFD7DFA3),
                  inactiveColor: Color(0xFF1A4862),
                  onChanged: (double newValue) {
                    setState(() {
                      sliderHeight = newValue.round();
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(children: <Widget>[
            Expanded(
              child: RepeatContainerCode(
                  onPressed: () {},
                  color: const Color(0xFFD7DFA3),
                  cardWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Weight',
                        style: kLabelStyle,
                      ),
                      Text(
                        sliderWeight.toString(),
                        style: kLabelStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIcon(
                            iconData: FontAwesomeIcons.minus,
                            onPress: () {
                              setState(() {
                                sliderWeight--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RoundIcon(
                            iconData: FontAwesomeIcons.plus,
                            onPress: () {
                              setState(() {
                                sliderWeight++;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          )
                        ],
                      )
                    ],
                  )),
            ),
            Expanded(
              child: RepeatContainerCode(
                  onPressed: () {},
                  color: const Color(0xFFD7DFA3),
                  cardWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Age',
                        style: kLabelStyle,
                      ),
                      Text(
                        sliderAge.toString(),
                        style: kLabelStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIcon(
                            iconData: FontAwesomeIcons.minus,
                            onPress: () {
                              setState(() {
                                sliderAge--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RoundIcon(
                              iconData: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  sliderAge++;
                                });
                              })
                        ],
                      )
                    ],
                  )),
            ),
          ]),
        ),
        GestureDetector(
            onTap: () {
              CalculatorBrain cal= CalculatorBrain(height: sliderHeight, weight: sliderWeight);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (Context) => ResultScreen(
                  bmiResult: cal.calculateBMI(),
                  resultText: cal.getResult(),
                  interpretation: cal.getInterpretation(),
                )),
              );
            },
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Container(
                  child: Center(
                    child: const Text(
                      "Calculate",
                      style: kLargeButtonStyle,
                    ),
                  ),
                  color: Color(0xFFD7DFA3),
                  margin: EdgeInsets.only(top: 10.0),
                  width: double.infinity,
                  height: 80.0,
                ),
              ),
            ))
      ]),
   ]) );
  }
}
