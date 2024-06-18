import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = '0';
  String _currentNumber = '';
  double _num1 = 0;
  double _num2 = 0;
  String _operand = '';

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _clearAll();
      } else if (_isOperator(buttonText)) {
        if (_operand.isNotEmpty && _currentNumber.isNotEmpty) {
          // If there's already an operation pending, perform it first
          _performOperation();
        }
        _num1 = double.parse(_output);
        _operand = buttonText;
        _currentNumber = '';
      } else if (buttonText == '.') {
        _handleDecimal();
      } else if (buttonText == '=') {
        if (_operand.isNotEmpty && _currentNumber.isNotEmpty) {
          _performOperation();
        }
      } else {
        // Handle digits
        _currentNumber += buttonText;
        _output = _currentNumber;
      }
    });
  }

  bool _isOperator(String buttonText) {
    return buttonText == '+' ||
        buttonText == '-' ||
        buttonText == '*' ||
        buttonText == '/';
  }

  void _clearAll() {
    _output = '0';
    _currentNumber = '';
    _num1 = 0;
    _num2 = 0;
    _operand = '';
  }

  void _handleDecimal() {
    if (!_output.contains('.')) {
      _output += '.';
      _currentNumber += '.';
    }
  }

  void _performOperation() {
    _num2 = double.parse(_currentNumber);
    switch (_operand) {
      case '+':
        _output = (_num1 + _num2).toString();
        break;
      case '-':
        _output = (_num1 - _num2).toString();
        break;
      case '*':
        _output = (_num1 * _num2).toString();
        break;
      case '/':
        _output = (_num1 / _num2).toString();
        break;
      default:
        _output = 'Error';
    }
    _num1 = 0;
    _num2 = 0;
    _currentNumber = '';
    _operand = '';
  }

  Widget _buildButton(
      String buttonText, double buttonHeight, Color buttonColor) {
    return Expanded(
      child: Container(
        height: double.infinity,
        color: buttonColor,
        child: TextButton(
          onPressed: () => _buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.normal,
                color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              alignment: Alignment.bottomRight,
              child: Text(
                _output,
                style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      _buildButton('7', 1, Colors.orange),
                      _buildButton('8', 1, Colors.orange),
                      _buildButton('9', 1, Colors.orange),
                      _buildButton('/', 1, Colors.orange),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      _buildButton('4', 1, Colors.orange),
                      _buildButton('5', 1, Colors.orange),
                      _buildButton('6', 1, Colors.orange),
                      _buildButton('*', 1, Colors.orange),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      _buildButton('1', 1, Colors.orange),
                      _buildButton('2', 1, Colors.orange),
                      _buildButton('3', 1, Colors.orange),
                      _buildButton('-', 1, Colors.orange),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      _buildButton('.', 1, Colors.orange),
                      _buildButton('0', 1, Colors.orange),
                      _buildButton('00', 1, Colors.orange),
                      _buildButton('+', 1, Colors.orange),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      _buildButton('C', 1, Colors.red),
                      _buildButton('=', 1, Colors.blue),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
