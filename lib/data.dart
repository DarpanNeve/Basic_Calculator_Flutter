import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

List<String> buttonsKeys = [
  'C',
  'ANS',
  '%',
  'DEL',
  '1',
  '2',
  '3',
  '+',
  '4',
  '5',
  '6',
  '-',
  '7',
  '8',
  '9',
  'x',
  '.',
  '0',
  '=',
  '/',
];
String content = "0";
double answerContent = 0.0;

class Calculate extends StatefulWidget {
  const Calculate({super.key});

  @override
  State<Calculate> createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {
  void onButtonClick(int index) {
    setState(() {
      if (isOperator(content[content.length - 1]) &&
          isOperator(buttonsKeys[index])) {
        if (buttonsKeys[index] == content[content.length - 1]) {
          //.
        } else if (isOperator(buttonsKeys[index])) {
          content =
              content.substring(0, content.length - 1) + buttonsKeys[index];
        }
      } else if (index == 0) {
        setState(() {
          content = "0";
          answerContent = 0.0;
        });
      } else if (index == 3) {
        if (content.length == 1) {
          setState(() {
            content = "0";
          });
        } else {
          content = content.substring(0, content.length - 1);
        }
      } else if (index == 1) {
        setState(() {
          content = answerContent.toString();
          answerContent = 0.0;
        });
        //ANS Tapped
      } else if (index == 18) {
        setState(() {
          evaluate();
        });
        //= Tapped
      } else {
        if (content.length == 1 &&
            content == "0" &&
            !isOperator(buttonsKeys[index])) {
          content = buttonsKeys[index];
        } else {
          content += buttonsKeys[index];
        }
      }
    });
  }

  bool isOperator(String temp) {
    if (temp == '+' ||
        temp == '-' ||
        temp == '/' ||
        temp == 'x' ||
        temp == '%') {
      return true;
    } else {
      return false;
    }
  }

  void evaluate() {
    String temp = content;
    if (isOperator(content[content.length - 1])) {
      temp = content.substring(0, content.length - 1);
    }
    if (content.contains('x')) {
      temp = content.replaceAll('x', '*');
    }
    Parser p = Parser();
    Expression exp = p.parse(temp);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answerContent = eval;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Flexible(
          flex: 1,
          fit: FlexFit.loose,
          child: Text(
            content,
            style: const TextStyle(fontSize: 28),
            textAlign: TextAlign.right,
          ),
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.loose,
          child: Text(
            "$answerContent",
            style: const TextStyle(fontSize: 28),
            textAlign: TextAlign.right,
          ),
        ),
        Expanded(
          flex: 5,
          child: GridView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  onButtonClick(index);
                },
                child: Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  margin: const EdgeInsets.all(05),
                  alignment: Alignment.center,
                  constraints: const BoxConstraints(),
                  child: Text(buttonsKeys[index],
                      style: const TextStyle(
                          fontSize: 20, color: Colors.deepOrangeAccent)),
                ),
              );
            },
            itemCount: buttonsKeys.length,
          ),
        ),
      ],
    );
  }
}
