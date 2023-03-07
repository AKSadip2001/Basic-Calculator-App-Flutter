import 'package:flutter/material.dart';
import 'package:my_calcu/button.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double expFontSize = 48;
  double resFontSize = 38;

  String _output = "0";
  String tempEpression = "";
  String expression = "";
  String finalResult = "0";
  double num1 = 0;
  double num2 = 0;
  String operand = "";
  int countDigit = 0;

  void executeEqualsto(String buttonText) {
    if (operand == "+") {
      num1 = num1 + num2;
      _output = num1.toString();
    } else if (operand == "-") {
      num1 = num1 - num2;
      _output = num1.toString();
    } else if (operand == String.fromCharCode(215)) {
      num1 = num1 * num2;
      _output = num1.toString();
    } else if (operand == String.fromCharCode(247)) {
      if (num2 == 0) {
        _output = "Division by zero";
      } else {
        num1 = num1 / num2;
        _output = num1.toString();
      }
    }

    try {
      double x = double.parse(_output);
      int y = x.floor();
      if (x - y != 0) {
        String temp;
        temp = x.toString();
        if (buttonText == "=") {
          temp = x.toStringAsPrecision(9);
        } else {
          temp = x.toString();
        }
        while (temp[temp.length - 1] == '0') {
          temp = temp.substring(0, temp.length - 1);
        }
        _output = temp;
      } else {
        _output = y.toString();
      }
    } on Exception {
      //No code
    }
  }

  buttonPressed(String buttonText) {
    if (buttonText == "AC") {
      _output = "0";
      num1 = 0;
      num2 = 0;
      countDigit = 0;
      tempEpression = "";
      expFontSize = 48;
      resFontSize = 38;
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == String.fromCharCode(247) ||
        buttonText == String.fromCharCode(215)) {
      if (operand == "") {
        num1 = double.parse(_output);
        countDigit = 0;
        operand = buttonText;
        _output = "0";
        tempEpression += buttonText;
      } else {
        num2 = double.parse(_output);
        countDigit = 0;
        executeEqualsto(buttonText);
        num2 = 0;
        operand = buttonText;
        tempEpression = _output + buttonText;
        _output = "0";
        countDigit = 0;
      }
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        print("Already contains .");
      } else {
        _output += buttonText;
        tempEpression += buttonText;
      }
    } else if (buttonText == "=") {
      expFontSize = 38;
      resFontSize = 48;
      num2 = double.parse(_output);
      countDigit = 0;

      executeEqualsto(buttonText);

      num2 = 0;
      operand = "";
    } else {
      expFontSize = 48;
      resFontSize = 38;
      if (num1 != 0 && operand == "") {
        num1 = 0;
        countDigit = 0;
        _output = "0";
        tempEpression = "";
      }
      if (countDigit < 9) {
        tempEpression += buttonText;
        _output += buttonText;
        countDigit++;
      }
    }

    setState(() {
      expression = tempEpression;
      if (buttonText == "=") {
        finalResult = "= " + _output;
      } else if (buttonText == "AC") {
        finalResult = "0";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 211, 151, 222),
      appBar: AppBar(
        title: Center(child: Text("My Calcu")),
        backgroundColor: Color.fromARGB(255, 200, 104, 218),
      ),
      body: Container(
        child: Column(children: <Widget>[
          Expanded(
            child: Divider(),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 12),
            child: Text(
              (expression == "") ? "0" : expression,
              style: TextStyle(
                fontSize: expFontSize,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 12, bottom: 18),
            child: Text(
              finalResult,
              style: TextStyle(
                fontSize: resFontSize,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  Button(
                      "7", Color.fromARGB(255, 200, 104, 218), buttonPressed),
                  Button(
                      "8", Color.fromARGB(255, 200, 104, 218), buttonPressed),
                  Button(
                      "9", Color.fromARGB(255, 200, 104, 218), buttonPressed),
                  Button(String.fromCharCode(247),
                      Color.fromARGB(255, 200, 104, 218), buttonPressed),
                ],
              ),
              Row(
                children: [
                  Button(
                      "4", Color.fromARGB(255, 200, 104, 218), buttonPressed),
                  Button(
                      "5", Color.fromARGB(255, 200, 104, 218), buttonPressed),
                  Button(
                      "6", Color.fromARGB(255, 200, 104, 218), buttonPressed),
                  Button(String.fromCharCode(215),
                      Color.fromARGB(255, 200, 104, 218), buttonPressed),
                ],
              ),
              Row(
                children: [
                  Button(
                      "1", Color.fromARGB(255, 200, 104, 218), buttonPressed),
                  Button(
                      "2", Color.fromARGB(255, 200, 104, 218), buttonPressed),
                  Button(
                      "3", Color.fromARGB(255, 200, 104, 218), buttonPressed),
                  Button(
                      "-", Color.fromARGB(255, 200, 104, 218), buttonPressed),
                ],
              ),
              Row(
                children: [
                  Button(
                      ".", Color.fromARGB(255, 200, 104, 218), buttonPressed),
                  Button(
                      "0", Color.fromARGB(255, 200, 104, 218), buttonPressed),
                  Button(
                      "00", Color.fromARGB(255, 200, 104, 218), buttonPressed),
                  Button(
                      "+", Color.fromARGB(255, 200, 104, 218), buttonPressed),
                ],
              ),
              Row(
                children: [
                  Button(
                      "AC", Color.fromARGB(255, 200, 104, 218), buttonPressed),
                  Button(
                      "=", Color.fromARGB(255, 200, 104, 218), buttonPressed),
                ],
              )
            ],
          )
        ]),
      ),
    );
  }
}
