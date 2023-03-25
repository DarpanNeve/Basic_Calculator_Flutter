
import 'package:flutter/material.dart';
import 'data.dart';

void main() {
  runApp(const Calculator());
}

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator",
      home: Scaffold(
        body: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Calculate(),
          ),
        ),
      ),
    );
  }
}
