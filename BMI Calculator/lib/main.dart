import 'package:flutter/material.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: Colors.white,
      ),
      home: BMICalculatorHome(),
    );
  }
}

class BMICalculatorHome extends StatefulWidget {
  @override
  _BMICalculatorHomeState createState() => _BMICalculatorHomeState();
}

class _BMICalculatorHomeState extends State<BMICalculatorHome> {
  double _heightFeet = 5;
  double _heightInches = 0;
  double _weight = 60;
  double _bmi = 0;
  String _resultText = "";

  void _calculateBMI() {
    final double heightInMeters = ((_heightFeet * 12) + _heightInches) * 0.0254;

    if (heightInMeters > 0 && _weight > 0) {
      setState(() {
        _bmi = _weight / (heightInMeters * heightInMeters);
        if (_bmi < 18.5) {
          _resultText = "Underweight";
        } else if (_bmi < 24.9) {
          _resultText = "Normal weight";
        } else if (_bmi < 29.9) {
          _resultText = "Overweight";
        } else {
          _resultText = "Obesity";
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                height: 100,
                width: 200,
              ),
              Text(
                'BMI Calculator',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 1,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      'Height',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Feet: ${_heightFeet.toStringAsFixed(0)}',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.redAccent,
                              ),
                            ),
                            Slider(
                              value: _heightFeet,
                              min: 3,
                              max: 7,
                              divisions: 4,
                              label: _heightFeet.round().toString(),
                              onChanged: (double value) {
                                setState(() {
                                  _heightFeet = value;
                                });
                              },
                              activeColor: Colors.redAccent,
                              inactiveColor: Colors.red[100],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Inches: ${_heightInches.toStringAsFixed(0)}',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.redAccent,
                              ),
                            ),
                            Slider(
                              value: _heightInches,
                              min: 0,
                              max: 11,
                              divisions: 11,
                              label: _heightInches.round().toString(),
                              onChanged: (double value) {
                                setState(() {
                                  _heightInches = value;
                                });
                              },
                              activeColor: Colors.redAccent,
                              inactiveColor: Colors.red[100],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Weight',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Weight: ${_weight.toStringAsFixed(0)} kg',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.redAccent,
                      ),
                    ),
                    Slider(
                      value: _weight,
                      min: 30,
                      max: 150,
                      divisions: 120,
                      label: _weight.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _weight = value;
                        });
                      },
                      activeColor: Colors.redAccent,
                      inactiveColor: Colors.red[100],
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _calculateBMI,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.redAccent,
                        textStyle: TextStyle(fontSize: 18),
                        padding:
                            EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: Text('Calculate BMI'),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Your BMI is: ${_bmi.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      _resultText,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
