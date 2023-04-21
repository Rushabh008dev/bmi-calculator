import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon.dart';
import 'card.dart';
import 'number_icon.dart';
import 'round_icon_button.dart';
import 'results_page.dart';
import 'bottom_button.dart';
import 'calculator_brain.dart';

const activecolor = Color(0XFF1D1F33);
const inactivecolor = Color(0XFF111328);

enum Gender {
  Male,
  Female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = inactivecolor;
  Color femaleCardColour = inactivecolor;
  int height = 180;
  int weight = 60;
  int age = 20;

  //1 --> Male , 2--> Female
  void colorChange(Gender selected_gender) {
    if (selected_gender == Gender.Male) {
      if (maleCardColour == inactivecolor) {
        maleCardColour = activecolor;
        femaleCardColour = inactivecolor;
      } else {
        maleCardColour = inactivecolor;
      }
    } else {
      if (femaleCardColour == inactivecolor) {
        femaleCardColour = activecolor;
        maleCardColour = inactivecolor;
      } else {
        femaleCardColour = inactivecolor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        colorChange(Gender.Male);
                      });
                    },
                    child: card(
                      colour: maleCardColour,
                      cardChild: icon(
                        req_icon: FontAwesomeIcons.mars,
                        req_data: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        colorChange(Gender.Female);
                      });
                    },
                    child: card(
                      colour: femaleCardColour,
                      cardChild: icon(
                        req_icon: FontAwesomeIcons.venus,
                        req_data: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: card(
              colour: activecolor,
              cardChild: numberIcon(
                req_units: 'cm',
                req_label: 'HEIGHT',
                req_data: height.toString(),
                req_widget: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Color(0XFF8D8E98),
                    thumbColor: Color(0XFFEB1555),
                    overlayColor: Color(0X29EB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 250.0,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: card(
                    colour: activecolor,
                    cardChild: numberIcon(
                      req_units: 'kg',
                      req_label: 'WEIGHT',
                      req_data: weight.toString(),
                      req_widget: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: card(
                    colour: activecolor,
                    cardChild: numberIcon(
                      req_units: ' ',
                      req_data: age.toString(),
                      req_label: 'AGE',
                      req_widget: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
            bottomButtonText: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}
