import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = "0";
  String _input = "0";
  String _operator = "";
  double num1 = 0.0;
  double num2 = 0.0;

  Widget calcbutton(String btntext, Color btncolor, Color txtcolor) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            buttonPressed(btntext);
          });
        },
        child: Text(
          btntext,
          style: TextStyle(
            fontSize: 25,
            color: txtcolor,
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          backgroundColor: btncolor,
          padding: EdgeInsets.all(20),
        ),
      ),
    );
  }

  buttonPressed(String btntext) {
    if (btntext == "AC") {
      _input = "0";
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      _operator = "";
    } else if (btntext == "DEL") {
      if (_input.isNotEmpty && _input != "0") {
        _input = _input.substring(0, _input.length - 1);
        if (_input.isEmpty) {
          _output = "0";
        } else {
          _output = _input;
        }
      }
    } else if (btntext == "+" || btntext == "-" || btntext == "x" || btntext == "/") {
      if (_input.isNotEmpty && _input != "0") {
        num1 = double.parse(_input);
        _operator = btntext;
        _input = "";
      }
    } else if (btntext == ".") {
      if (!_input.contains(".")) {
        _input = _input + btntext;
      }
      _output = _input;
    } else if (btntext == "=") {
      if (_input.isNotEmpty && _input != "0") {
        num2 = double.parse(_input);
        if (_operator == "+") {
          _output = (num1 + num2).toString();
        } else if (_operator == "-") {
          _output = (num1 - num2).toString();
        } else if (_operator == "x") {
          _output = (num1 * num2).toString();
        } else if (_operator == "/") {
          _output = (num1 / num2).toString();
        }
        _input = _output;
        _operator = "";
      }
    } else {
      if (_input == "0") {
        _input = btntext;
      } else {
        _input = _input + btntext;
      }
      _output = _input;
    }

    setState(() {
      _output = double.parse(_output).toStringAsFixed(2).replaceAll(RegExp(r"([.]*0)(?!.*\d)"), "");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Calculator"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    _output,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white, fontSize: 100),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcbutton('AC', Colors.grey, Colors.black),
                calcbutton('DEL', Colors.grey, Colors.black),
                calcbutton('%', Colors.grey, Colors.black),
                calcbutton('/', Colors.amber, Colors.white),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcbutton('7', Color.fromARGB(255, 66, 66, 66), Colors.white),
                calcbutton('8', Color.fromARGB(255, 66, 66, 66), Colors.white),
                calcbutton('9', Color.fromARGB(255, 66, 66, 66), Colors.white),
                calcbutton('x', Colors.amber, Colors.white),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcbutton('4', Color.fromARGB(255, 66, 66, 66), Colors.white),
                calcbutton('5', Color.fromARGB(255, 66, 66, 66), Colors.white),
                calcbutton('6', Color.fromARGB(255, 66, 66, 66), Colors.white),
                calcbutton('-', Colors.amber, Colors.white),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcbutton('1', Color.fromARGB(255, 66, 66, 66), Colors.white),
                calcbutton('2', Color.fromARGB(255, 66, 66, 66), Colors.white),
                calcbutton('3', Color.fromARGB(255, 66, 66, 66), Colors.white),
                calcbutton('+', Colors.amber, Colors.white),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 66, 66, 66),
                      shape: StadiumBorder(),
                      padding: EdgeInsets.fromLTRB(34, 15, 128, 15)),
                  onPressed: () {
                    setState(() {
                      buttonPressed("0");
                    });
                  },
                  child: Text(
                    "0",
                    style: TextStyle(fontSize: 35, color: Colors.white),
                  ),
                ),
                calcbutton('.', Color.fromARGB(255, 66, 66, 66), Colors.white),
                calcbutton('=', Colors.amber, Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
