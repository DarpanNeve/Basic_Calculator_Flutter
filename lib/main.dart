import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'data.dart';


String content = "0";
double answerContent = 0.0;
void main() {
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator",
      home: Scaffold(
        body: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: Text(content, style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.right,),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: Text(answerContent.toString(), style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.right,),
                ),
                Expanded(
                  flex: 4,
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {

                        },
                        child: Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          margin: const EdgeInsets.all(05),
                          alignment: Alignment.center,
                          constraints: const BoxConstraints(),
                          child: Text(buttonsKeys[index],
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.deepOrangeAccent)),
                        ),
                      );
                    },
                    itemCount: buttonsKeys.length,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}

