import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'drawer.dart';
//import 'scientificcalc.dart';
//import 'main.dart';

class normalCalculator extends StatefulWidget {
  _normalCalculatorState createState() => _normalCalculatorState();
}


class _normalCalculatorState extends State<normalCalculator> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Center(child: Text('Normal Calculator')),
        ],
      ),





    );
  }
}