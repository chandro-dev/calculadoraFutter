import 'package:aprendiendoflutter/widgets/CalcButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => calculadora();
}

class calculadora extends State<MyApp> {
  String _hystory = "";
  String _expression = "";
  void allClear(String textButton) {
    setState(() {
      _hystory = "";
      _expression = "";
    });
  }

  void clear(String textButton) {
    setState(() {
      _expression = "";
    });
  }

  void evalute(String textButton) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();

    setState(() {
      _hystory = _expression;
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  void numClick(String textButton) {
    setState(() {
      _expression += textButton;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora',
      home: Scaffold(
        backgroundColor: Color.fromARGB(199, 10, 209, 209),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                alignment: const Alignment(1, 1),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 12),
                  child: Text(
                    _hystory,
                    style: GoogleFonts.rubik(
                        textStyle:
                            const TextStyle(fontSize: 24, color: Colors.white)),
                  ),
                ),
              ),
              Container(
                  alignment: const Alignment(1, 1),
                  padding: EdgeInsets.all(8.0),
                  child: Text(_expression,
                      style: GoogleFonts.rubik(
                          textStyle: const TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)))),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    callBack: numClick,
                    textButton: "1",
                    testSize: 20,
                  ),
                  CalcButton(
                    callBack: numClick,
                    textButton: "2",
                    testSize: 20,
                  ),
                  CalcButton(
                    callBack: numClick,
                    textButton: "3",
                    testSize: 20,
                  ),
                  CalcButton(
                    callBack: numClick,
                    textButton: "4",
                    testSize: 20,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    textButton: "5",
                    callBack: numClick,
                    testSize: 20,
                  ),
                  CalcButton(
                    textButton: "6",
                    callBack: numClick,
                    testSize: 20,
                  ),
                  CalcButton(
                    callBack: numClick,
                    textButton: "7",
                    testSize: 20,
                  ),
                  CalcButton(
                    callBack: numClick,
                    textButton: "8",
                    testSize: 20,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    textButton: "C",
                    callBack: allClear,
                    testSize: 20,
                  ),
                  CalcButton(
                    textButton: "9",
                    callBack: numClick,
                    testSize: 20,
                  ),
                  CalcButton(
                    textButton: "10",
                    callBack: numClick,
                    testSize: 20,
                  ),
                  CalcButton(
                    textButton: "AC",
                    callBack: clear,
                    testSize: 20,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    textButton: "+",
                    callBack: numClick,
                    testSize: 20,
                  ),
                  CalcButton(
                    textButton: "-",
                    callBack: numClick,
                    testSize: 20,
                  ),
                  CalcButton(
                    callBack: numClick,
                    textButton: "/",
                    testSize: 20,
                  ),
                  CalcButton(
                    callBack: evalute,
                    textButton: "=",
                    testSize: 20,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
