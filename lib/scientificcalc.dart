import 'normalcalc.dart';
import 'main.dart';
import 'drawer.dart';
import 'package:toast/toast.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class scientificCalculator extends StatefulWidget {
  _scientificCalculatorState createState() => _scientificCalculatorState();
}

class _scientificCalculatorState extends State<scientificCalculator> {
  TextEditingController input = TextEditingController();
  String operator;
  double num1 = 0;
  double num2 = 0;

  _operation() {
    if (operator == '+') {
      input.text = (num1 + num2).toString();
    }
    if (operator == '-') {
      input.text = (num1 - num2).toString();
    }
    if (operator == '*') {
      input.text = (num1 * num2).toString();
    }
    if (operator == '%'){
      input.text = (num1 * (num2 * 0.01)).toString();
    }
    if (operator == '/') {
      if (num2 == 0) {
        Toast.show("A Number cannot be divided by zero", context,
            duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      } else {
        input.text = (num1 / num2).toString();
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Colors.white, Colors.white, Color(0xffFFCAFD)]
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 250,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: input,
                textAlign: TextAlign.end,
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple))),
                showCursor: true,
                readOnly: true,
                style: new TextStyle(color: Colors.purple, fontSize: 60),
              ),
            ),

            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedGradientButton(
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              gradient: LinearGradient(
                                  colors: [Colors.purple, Colors.deepPurple, Colors.indigo,])),
                          child: Center(
                              child: Text(
                                "sin",
                                style: TextStyle(color: Colors.white, fontSize: 30),
                              ))),
                    ),
                    onPressed: () {
                      input.text = "0";
                    },
                  ),
                ),
                Expanded(
                  child: RaisedGradientButton(
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                            //shape: BoxShape.circle,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              gradient: LinearGradient(
                                  colors: [Colors.purple, Colors.deepPurple, Colors.indigo,])),
                          child: Center(
                              child: Text(
                                "cos",
                                style: TextStyle(color: Colors.white, fontSize: 30),
                              ))),
                    ),
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child: RaisedGradientButton(
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                            //shape: BoxShape.circle,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              gradient: LinearGradient(
                                  colors: [Colors.purple, Colors.deepPurple, Colors.indigo,])),
                          child: Center(
                              child: Text(
                                "tan",
                                style: TextStyle(color: Colors.white, fontSize: 30),
                              ))),
                    ),
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child: RaisedGradientButton(
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                            //shape: BoxShape.circle,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              gradient: LinearGradient(
                                  colors: [Colors.purple, Colors.deepPurple, Colors.indigo,])),
                          child: Center(
                              child: Text(
                                "^",
                                style: TextStyle(color: Colors.white, fontSize: 30),
                              ))),
                    ),
                    onPressed: () {
                      num1 = double.parse(input.text);
                      input.text = "0";
                      operator = '/';
                    },
                  ),
                ),
                Expanded(
                  child: RaisedGradientButton(
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                            //shape: BoxShape.circle,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              gradient: LinearGradient(
                                  colors: [Colors.purple, Colors.deepPurple, Colors.indigo,])),
                          child: Center(
                              child: Text(
                                "/",
                                style: TextStyle(color: Colors.white, fontSize: 30),
                              ))),
                    ),
                    onPressed: () {
                      num1 = double.parse(input.text);
                      input.text = "0";
                      operator = '/';
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedGradientButton(
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                            //shape: BoxShape.circle,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              gradient: LinearGradient(
                                  colors: [Colors.purple, Colors.deepPurple, Colors.indigo,])),
                          child: Center(
                              child: Text(
                                "sin⁻¹",
                                style: TextStyle(color: Colors.white, fontSize: 30),
                              ))),
                    ),
                    onPressed: () {
                      input.text = "0";
                    },
                  ),
                ),
                Expanded(
                  child: RaisedGradientButton(
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                            //shape: BoxShape.circle,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              gradient: LinearGradient(
                                  colors: [Colors.purple, Colors.deepPurple, Colors.indigo,])),
                          child: Center(
                              child: Text(
                                "cos⁻¹",
                                style: TextStyle(color: Colors.white, fontSize: 30),
                              ))),
                    ),
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child: RaisedGradientButton(
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              gradient: LinearGradient(
                                  colors: [Colors.purple, Colors.deepPurple, Colors.indigo,])),
                          child: Center(
                              child: Text(
                                "tan⁻¹",
                                style: TextStyle(color: Colors.white, fontSize: 30),
                              ))),
                    ),
                    onPressed: () {},
                  ),
                ),

                Expanded(
                  child: RaisedGradientButton(
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                            //shape: BoxShape.circle,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              gradient: LinearGradient(
                                  colors: [Colors.purple, Colors.deepPurple, Colors.indigo,])),
                          child: Center(
                              child: Text(
                                "√",
                                style: TextStyle(color: Colors.white, fontSize: 30),
                              ))),
                    ),
                    onPressed: () {
                      num1 = double.parse(input.text);
                      input.text = "0";
                      operator = '/';
                    },
                  ),
                ),
                Expanded(
                  child: RaisedGradientButton(
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              gradient: LinearGradient(colors: [Colors.purple, Colors.deepPurple, Colors.indigo,])
                          ),
                          child: Center(child: Text("%", style: TextStyle(color: Colors.white, fontSize: 30),))),
                    ),
                    onPressed: () {
                      input.text += "%";
                      operator = '%';
                    },
                  ),
                ),
              ],
            ),

            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedGradientButton(
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                              //shape: BoxShape.circle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              gradient: LinearGradient(
                                  colors: [Colors.purple, Colors.deepPurple, Colors.indigo,])),
                          child: Center(
                              child: Text(
                            "9",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ))),
                    ),
                    onPressed: () {
                      if (input.text == "0" || input.text == "00" || input.text == " ")
                      {input.text = "9";}
                      else {
                        input.text += "9";
                      }

                    },
                  ),
                ),
                Expanded(
                  child: RaisedGradientButton(
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                              //shape: BoxShape.circle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              gradient: LinearGradient(
                                  colors: [Colors.purple, Colors.deepPurple, Colors.indigo,])),
                          child: Center(
                              child: Text(
                            "8",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ))),
                    ),
                    onPressed: () {
                      if (input.text == "0" || input.text == "00" || input.text == " ")
                      {input.text = "8";}
                      else {
                        input.text += "8";
                      }
                    },
                  ),
                ),
                Expanded(
                  child: RaisedGradientButton(
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                              //shape: BoxShape.circle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              gradient: LinearGradient(
                                  colors: [Colors.purple, Colors.deepPurple, Colors.indigo,])),
                          child: Center(
                              child: Text(
                            "7",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ))),
                    ),
                    onPressed: () {
                      if (input.text == "0" || input.text == "00" || input.text == " ")
                      {input.text = "7";}
                      else {
                        input.text += "7";
                      }
                    },
                  ),
                ),
                Expanded(
                  child: RaisedGradientButton(
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                            //shape: BoxShape.circle,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              gradient: LinearGradient(colors: [Colors.purple, Colors.deepPurple, Colors.indigo,])
                          ),
                          child: Center(child: Text(
                            "e^",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ))),
                    ),
                    onPressed: () {
                      //num1 = double.parse(input.text);
                      input.text += "%";
                      operator = '%';
                    },
                  ),
                ),
                Expanded(
                  child: RaisedGradientButton(
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                              //shape: BoxShape.circle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              gradient: LinearGradient(
                                  colors: [Colors.purple, Colors.deepPurple, Colors.indigo,])),
                          child: Center(
                              child: Text(
                            "*",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ))),
                    ),
                    onPressed: () {
                      num1 = double.parse(input.text);
                      input.text = "0";
                      operator = '*';
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedGradientButton(
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                              //shape: BoxShape.circle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              gradient: LinearGradient(
                                  colors: [Colors.purple, Colors.deepPurple, Colors.indigo,])),
                          child: Center(
                              child: Text(
                            "6",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ))),
                    ),
                    onPressed: () {
                      if (input.text == "0" || input.text == "00" || input.text == " ")
                      {input.text = "6";}
                      else {
                        input.text += "6";
                      }
                    },
                  ),
                ),
                Expanded(
                  child: RaisedGradientButton(
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                              //shape: BoxShape.circle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              gradient: LinearGradient(
                                  colors: [Colors.purple, Colors.deepPurple, Colors.indigo,])),
                          child: Center(
                              child: Text(
                            "5",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ))),
                    ),
                    onPressed: () {
                      if (input.text == "0" || input.text == "00" || input.text == " ")
                      {input.text = "5";}
                      else {
                        input.text += "5";
                      }
                    },
                  ),
                ),
                Expanded(
                  child: RaisedGradientButton(
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                              //shape: BoxShape.circle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              gradient: LinearGradient(
                                  colors: [Colors.purple, Colors.deepPurple, Colors.indigo,])),
                          child: Center(
                              child: Text(
                            "4",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ))),
                    ),
                    onPressed: () {
                      if (input.text == "0" || input.text == "00" || input.text == " ")
                      {input.text = "4";}
                      else {
                        input.text += "4";
                      }
                    },
                  ),
                ),
                Expanded(
                  child: RaisedGradientButton(
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                            //shape: BoxShape.circle,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              gradient: LinearGradient(
                                  colors: [Colors.purple, Colors.deepPurple, Colors.indigo,])),
                          child: Center(
                              child: Text(
                                "log",
                                style: TextStyle(color: Colors.white, fontSize: 30),
                              ))),
                    ),
                    onPressed: () {
                      input.text = "0";
                    },
                  ),
                ),
                Expanded(
                  child: RaisedGradientButton(
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                              //shape: BoxShape.circle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              gradient: LinearGradient(
                                  colors: [Colors.purple, Colors.deepPurple, Colors.indigo,])),
                          child: Center(
                              child: Text(
                            "-",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ))),
                    ),
                    onPressed: () {
                      num1 = double.parse(input.text);
                      input.text = "0";
                      operator = '-';
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedGradientButton(
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                              //shape: BoxShape.circle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              gradient: LinearGradient(
                                  colors: [Colors.purple, Colors.deepPurple, Colors.indigo,])),
                          child: Center(
                              child: Text(
                            "3",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ))),
                    ),
                    onPressed: () {
                      if (input.text == "0" || input.text == "00" || input.text == " ")
                      {input.text = "3";}
                      else {
                        input.text += "3";
                      }
                    },
                  ),
                ),
                Expanded(
                  child: RaisedGradientButton(
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                              //shape: BoxShape.circle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              gradient: LinearGradient(
                                  colors: [Colors.purple, Colors.deepPurple, Colors.indigo,])),
                          child: Center(
                              child: Text(
                            "2",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ))),
                    ),
                    onPressed: () {
                      if (input.text == "0" || input.text == "00" || input.text == " ")
                      {input.text = "2";}
                      else {
                        input.text += "2";
                      }
                    },
                  ),
                ),
                Expanded(
                  child: RaisedGradientButton(
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                              //shape: BoxShape.circle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              gradient: LinearGradient(
                                  colors: [Colors.purple, Colors.deepPurple, Colors.indigo,])),
                          child: Center(
                              child: Text(
                            "1",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ))),
                    ),
                    onPressed: () {
                      if (input.text == "0" || input.text == "00" || input.text == " ")
                      {input.text = "1";}
                      else {
                        input.text += "1";
                      }
                    },
                  ),
                ),
                Expanded(
                  child: RaisedGradientButton(
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                            //shape: BoxShape.circle,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              gradient: LinearGradient(
                                  colors: [Colors.purple, Colors.deepPurple, Colors.indigo,])),
                          child: Center(
                              child: Text(
                                "e",
                                style: TextStyle(color: Colors.white, fontSize: 30),
                              ))),
                    ),
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child: RaisedGradientButton(
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                              //shape: BoxShape.circle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              gradient: LinearGradient(
                                  colors: [Colors.purple, Colors.deepPurple, Colors.indigo,])),
                          child: Center(
                              child: Text(
                            "+",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ))),
                    ),
                    onPressed: () {
                      num1 = double.parse(input.text);
                      input.text = "0";
                      operator = '+';
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedGradientButton(
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                              //shape: BoxShape.circle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              gradient: LinearGradient(
                                  colors: [Colors.purple, Colors.deepPurple, Colors.indigo,])),
                          child: Center(
                              child: Text(
                            "AC",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ))),
                    ),
                    onPressed: () {
                      input.text = "0";
                    },
                  ),
                ),
                Expanded(
                  child: RaisedGradientButton(
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                              //shape: BoxShape.circle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              gradient: LinearGradient(
                                  colors: [Colors.purple, Colors.deepPurple, Colors.indigo,])),
                          child: Center(
                              child: Text(
                            "0",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ))),
                    ),
                    onPressed: () {
                      if (input.text == "0" || input.text == "00" || input.text == " ")
                      {input.text = "0";}
                      else {
                        input.text += "0";
                      };
                    },
                  ),
                ),
                Expanded(
                  child: RaisedGradientButton(
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                              //shape: BoxShape.circle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              gradient: LinearGradient(
                                  colors: [Colors.purple, Colors.deepPurple, Colors.indigo,])),
                          child: Center(
                              child: Text(
                            ".",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ))),
                    ),
                    onPressed: () {
                      if (input.text.contains(".")) {
                        Toast.show("Already Contains a decimal", context,
                            duration: Toast.LENGTH_SHORT,
                            gravity: Toast.BOTTOM);
                      } else {
                        input.text += ".";
                      }
                    },
                  ),
                ),
                Expanded(
                  child: RaisedGradientButton(
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                            //shape: BoxShape.circle,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              gradient: LinearGradient(
                                  colors: [Colors.purple, Colors.deepPurple, Colors.indigo,])),
                          child: Center(
                              child: Text(
                                "π",
                                style: TextStyle(color: Colors.white, fontSize: 30),
                              ))),
                    ),
                    onPressed: () {
                      input.text = "0";
                    },
                  ),
                ),
                Expanded(
                  child: RaisedGradientButton(
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                              //shape: BoxShape.circle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              gradient: LinearGradient(
                                  colors: [Colors.purple, Colors.deepPurple, Colors.indigo,])),
                          child: Center(
                              child: Text(
                            "=",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ))),
                    ),
                    onPressed: () {
                      num2 = double.parse(input.text.replaceAll('%', ''));
                      _operation();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RaisedGradientButton extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final double width;
  final double height;
  final Function onPressed;

  const RaisedGradientButton({
    Key key,
    @required this.child,
    this.gradient,
    this.width = 70.0,
    this.height = 70.0,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 70.0,
      decoration: BoxDecoration(gradient: gradient,
          borderRadius:
          BorderRadius.all(Radius.circular(10)),
          boxShadow: [

      ]),

      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: onPressed,
            child: Center(
              child: child,
            )),
      ),
    );
  }
}
