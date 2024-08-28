import 'package:calculator_01/Widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var userQuestions = '';
  var userAnswers = '';
  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        children: <Widget>[
          Expanded(
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            userQuestions,
                            style: const TextStyle(fontSize: 30),
                          ))),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            userAnswers,
                            style: const TextStyle(fontSize: 20),
                          ))),
                ),
              ],
            ),
          )),
          Expanded(
              flex: 2,
              child: Container(
                  child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return MyButton(
                      buttonOnTaped: () {
                        setState(() {
                          userQuestions = '';
                          userAnswers = '';
                        });
                      },
                      text: buttons[index],
                      color: Colors.green,
                      textColor: Colors.white,  
                    );
                  } else if (index == 1) {
                    // delete button
                    return MyButton(
                      buttonOnTaped: () {
                        setState(() {
                          userQuestions = userQuestions.substring(
                              0, userQuestions.length - 1);
                        });
                      },
                      text: buttons[index],
                      color: Colors.red,
                      textColor: Colors.white,
                    );
                  } else if (index == buttons.length - 1) {
                    //  equal button
                    return MyButton(
                      buttonOnTaped: () {
                        setState(() {
                          equalPressed();
                        });
                      },
                      text: buttons[index],
                      color: Colors.black,
                      textColor: Colors.white,
                    );
                  } else {
                    return MyButton(
                      buttonOnTaped: () {
                        setState(() {
                          userQuestions += buttons[index];
                        });
                      },
                      text: buttons[index],
                      color: isOperator(buttons[index])
                          ? Colors.deepPurple
                          : Colors.deepPurple[50],
                      textColor: isOperator(buttons[index])
                          ? Colors.white
                          : Colors.deepPurple,
                    );
                  }
                },
              ))),
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

  void equalPressed() {
    String finalQuestion = userQuestions;
    finalQuestion = finalQuestion.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    userAnswers = eval.toString();
  }
}
