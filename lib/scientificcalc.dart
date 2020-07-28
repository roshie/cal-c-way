import 'normalcalc.dart';
import 'main.dart';
import 'drawer.dart';
import 'package:flutter/material.dart';

class scientificCalculator extends StatefulWidget {
  _scientificCalculatorState createState() => _scientificCalculatorState();
}


class _scientificCalculatorState extends State<scientificCalculator> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Center(child: Text('scientific Calculator')),
        ],
      ),

    );
  }
}