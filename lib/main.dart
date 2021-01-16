import 'package:calculator/CalcButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MaterialApp(
    title: 'MyCals',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.grey
    ),
    home: MyCal(),
  ));
}

class MyCal extends StatefulWidget {
  @override
  _MyCalState createState() => _MyCalState();
}

class _MyCalState extends State<MyCal> {
  String _history = '';
  String _expression = '';

  void numClick(String text) {
    setState(() {
      _expression += text;
    });
  }

  void allClear(String text) {
    setState(() {
      _expression = '';
      _history = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text) {
    Parser parser = Parser();
    Expression expression = parser.parse(_expression);
    ContextModel cm = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, cm);

    setState(() {
      _history = _expression;
      _expression = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
      backgroundColor: Color(0xFF283737),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                SizedBox(height: 40,),
                Container(
                  alignment: Alignment(1,1),
                  padding: EdgeInsets.only(right: 12),
//            padding: EdgeInsets.all(12),
                  child: Text(
                    _history,
                    style: TextStyle(
                        fontSize: 24, color: Color(0xFF545F61), fontFamily: 'Varela'),
                  ),
                ),
                Container(
                  alignment: Alignment(1,1),
                  //padding: EdgeInsets.only(right: 12),
                  padding: EdgeInsets.all(12),
                  child: Text(
                    _expression,
                    style: TextStyle(
                        fontSize: 48, color: Colors.white, fontFamily: 'Varela'),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalcButton(
                      text: 'AC',
                      fillColor: 0xFF6C807F,
                      textSize: 20,
                      callback: allClear,
                    ),
                    CalcButton(
                      text: 'C',
                      fillColor: 0xFF6C807F,
                      callback: clear,
                    ),
                    CalcButton(
                      text: '%',
                      fillColor: 0xFFFFFFFF,
                      textColor: 0xFF65BDAC,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '/',
                      fillColor: 0xFFFFFFFF,
                      textColor: 0xFF65BDAC,
                      callback: numClick,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalcButton(
                      text: '7',
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '8',
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '9',
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '*',
                      fillColor: 0xFFFFFFFF,
                      textColor: 0xFF65BDAC,
                      textSize: 28,
                      callback: numClick,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalcButton(
                      text: '4',
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '5',
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '6',
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '-',
                      fillColor: 0xFFFFFFFF,
                      textColor: 0xFF65BDAC,
                      textSize: 38,
                      callback: numClick,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalcButton(
                      text: '1',
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '2',
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '3',
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '+',
                      fillColor: 0xFFFFFFFF,
                      textColor: 0xFF65BDAC,
                      textSize: 30,
                      callback: numClick,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalcButton(
                      text: '.',
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '0',
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '00',
                      callback: numClick,
                      textSize: 26,
                    ),
                    CalcButton(
                      text: '=',
                      fillColor: 0xFFFFFFFF,
                      textColor: 0xFF65BDAC,
                      callback: evaluate,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
