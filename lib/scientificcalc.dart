import 'package:quartet/quartet.dart';
import 'package:toast/toast.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class scientificCalculator extends StatefulWidget {
  _scientificCalculatorState createState() => _scientificCalculatorState();
}

class _scientificCalculatorState extends State<scientificCalculator> {
  TextEditingController input = TextEditingController();
  String str = "";
  String operator = '';
  String function = "";
  double num1 = 0;
  double num2 = 0;
  double num = 0;


  backspace(String Input) {
    int n = Input.length;
    String erased = substr(Input,-1,1);
    if (erased == '+' || erased == '-' || erased == 'X' || erased == '/' || erased == '%' || erased == '^') {
      String sliced = Input.substring(0, n - 1);
      operator='';
      input.text = num1.toString();
      return sliced;
    }else
    if (erased == 'n' || erased == 's'|| erased =='e' || erased == '¹' || erased == 'g' || erased == '√'){
      if (erased =='e' || erased == '√') {
      String sliced = Input.substring(0, n - 1);
      function ='';
      return sliced;}
      else if (erased == 'n' || erased == 's'|| erased == 'g') {
        String sliced = Input.substring(0, n - 3);
        function ='';
        return sliced;
      }
      else if (erased == '¹') {
        String sliced = Input.substring(0, n - 5);
        function ='';
        return sliced;
      }
    }
    else {
      String sliced = Input.substring(0, n - 1);
      return sliced;
    }


  }

  clear() {
    input.text= "0";
    str = "";
    operator = '';
    function = "";
    num1 = 0; num2 = 0;
    setState(() {});
  }

  _function(double num, String function) {
    if (function == "sin"){
      return double.parse(sin(num*0.0175).toStringAsFixed(4));
    }
    if (function == "cos"){
      return double.parse(cos(num*0.0175).toStringAsFixed(4));
    }
    if (function == "tan"){
      return double.parse(tan(num*0.0175).toStringAsFixed(4));
    }
    if (function == "asin"){
      return double.parse(asin(num).toStringAsFixed(4));
    }
    if (function == "acos"){
      return double.parse(acos(num).toStringAsFixed(4));
    }
    if (function == "atan"){
      return double.parse(atan(num).toStringAsFixed(4));
    }
    if (function == "sqrt"){
      return double.parse(sqrt(num).toStringAsFixed(4));
    }
    if (function == "log"){
      return double.parse(log(num).toStringAsFixed(4));
    }
    if (function == "exp"){
      return double.parse(exp(num).toStringAsFixed(4));
    }


  }

  _operation() {
    if (operator == '+'){
      String output = (num1 + num2).toStringAsFixed(4).toString();
      String sliced_op = substr(output, -5, 5);
      if (sliced_op == ".0000"){
        input.text = output.replaceAll(".0000", '');
      }
      else {
        input.text = output;
      }
    }
    if (operator == '-'){
      String output = (num1 - num2).toStringAsFixed(4).toString();
      String sliced_op = substr(output, -5, 5);
      if (sliced_op == ".0000"){
        input.text = output.replaceAll(".0000", '');
      }
      else {
        input.text = output;
      }
    }
    if (operator == '*'){
      String output = (num1 * num2).toStringAsFixed(4).toString();
      String sliced_op = substr(output, -5, 5);
      if (sliced_op == ".0000"){
        input.text = output.replaceAll(".0000", '');
      }
      else {
        input.text = output;
      }
    }
    if (operator == '%'){
      String output = (num1 * (num2 * 0.01)).toString();
      String sliced_op = substr(output, -2, 2);
      if (sliced_op == ".0"){
        input.text = output.replaceAll(".0", '');
      }
      else {
        input.text = output;
      }
    }
    if (operator == "^"){
      String output = pow(num1, num2).toString();
      String sliced_op = substr(output, -2, 2);
      if (sliced_op == ".0"){
        input.text = output.replaceAll(".0", '');
      }
      else {
        input.text = output;
      }
    }
    if (operator == '/'){
      if (num2 == 0){
        Toast.show("A Number cannot be divided by zero", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
      }else {
        String output = (num1 / num2).toStringAsFixed(4).toString();
        String sliced_op = substr(output, -5, 5);
        if (sliced_op == ".0000"){
          input.text = output.replaceAll(".0000", '');
        }
        else {
          input.text = output;
        }
      }
    }
    setState(() {
    });
    operator = '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Colors.white, Colors.white, Color(0xffFFCAFD)]
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    str,style: TextStyle(color: Colors.deepPurple, fontSize: 60), textAlign: TextAlign.end,
                  ),
                ),
                Container(
                  height: 70,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: input,
                    textAlign: TextAlign.end,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    showCursor: true,
                    readOnly: true,
                    style: new TextStyle(
                        color: Colors.purpleAccent,
                        fontSize: 30
                    ),
                  ),
                ),
                new Divider(
                  color: Colors.purple,
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
                                    "√2",
                                    style: TextStyle(color: Colors.white, fontSize: 30),
                                  ))),
                        ),
                        onPressed: () {
                          if (input.text == "" || input.text == " " || input.text == "0")
                          {input.text = sqrt2.toStringAsFixed(4).toString();}
                          else {
                            num1 = double.parse(input.text);
                            operator = "*";
                            input.text = sqrt2.toStringAsFixed(4).toString();
                          }
                          str += "√2";
                          setState(() {});
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
                                    "ln2",
                                    style: TextStyle(color: Colors.white, fontSize: 30),
                                  ))),
                        ),
                        onPressed: () {
                          if (input.text == "" || input.text == " " || input.text == "0")
                          {input.text = ln2.toStringAsFixed(4).toString();}
                          else {
                            num1 = double.parse(input.text);
                            operator = "*";
                            input.text = ln2.toStringAsFixed(4).toString();
                          }
                          str += "ln2";
                          setState(() {});
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
                                    "log₁₀e",
                                    style: TextStyle(color: Colors.white, fontSize: 30),
                                  ))),
                        ),
                        onPressed: () {
                          if (input.text == "" || input.text == " " || input.text == "0")
                          {input.text = log10e.toStringAsFixed(4).toString();}
                          else {
                            num1 = double.parse(input.text);
                            operator = "*";
                            input.text = log10e.toStringAsFixed(4).toString();
                          }
                          str += "log₁₀e";
                          setState(() {});
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
                        onPressed: ()  {if (input.text == "" || input.text == " " || input.text == "0")
                                    {input.text = pi.toStringAsFixed(4).toString();}
                                    else {
                                    num1 = double.parse(input.text);
                                    operator = "*";
                                    input.text = pi.toStringAsFixed(4).toString();
                        }
                        str += "π";
                        setState(() {});}
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
                              child: Center(child: Icon(Icons.backspace, color: Colors.white,))),
                        ),
                        onPressed: () {
                          if (input.text == "" || input.text == "0"){
                          }
                          else {
                            input.text = backspace(input.text);
                            if (input.text == "") input.text = "0";
                          }
                          if (str == "" || str == "0"){
                          }
                          else {
                            str = backspace(str);
                          }
                            setState(() {});
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
                          if (input.text == "0" || input.text == "00" || input.text == " " || input.text == "")
                          {str += "sin";
                          function = "sin";
                          }
                          else {
                            num1 = double.parse(input.text);
                            operator = "*";
                            str += "sin";
                            function = "sin";
                            input.text = "0";
                          }

                          setState(() {});
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
                        onPressed: () {if (input.text == "0" || input.text == "00" || input.text == " " || input.text == "")
                        {str += "cos";
                        function = "cos";
                        }
                        else {
                          num1 = double.parse(input.text);
                          operator = "*";
                          str += "cos";
                          function = "cos";
                          input.text = "0";
                        }

                        setState(() {});
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
                                    "tan",
                                    style: TextStyle(color: Colors.white, fontSize: 30),
                                  ))),
                        ),
                        onPressed: () {
                          if (input.text == "0" || input.text == "00" || input.text == " " || input.text == "")
                          {str += "tan";
                          function = "tan";
                          }
                          else {
                            num1 = double.parse(input.text);
                            operator = "*";
                            str += "tan";
                            function = "tan";
                            input.text = "0";
                          }
                          setState(() {});
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
                                    "^",
                                    style: TextStyle(color: Colors.white, fontSize: 30),
                                  ))),
                        ),
                        onPressed: () {
                          str += "^";
                          if (operator == ''){
                            operator = '^';
                            if (input.text != "") num1 = double.parse(input.text);
                            input.text = "0";}
                          else {
                            num2 = double.parse(input.text.replaceAll('%', ''));
                            _operation();
                            operator = '^';
                            if (input.text != "") num1 = double.parse(input.text);
                            input.text = "0";
                          }
                          setState(() {

                          });
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
                          str += "/";
                          setState(() {});
                          if (function != ""){
                            if (input.text != "") num1 = double.parse(input.text);
                            input.text = _function(num1,function).toString();
                            function = "";
                            setState(() {
                            });
                          }
                          if (operator == ''){
                            operator = '/';
                            if (input.text != "") num1 = double.parse(input.text);
                            input.text = "0";}
                          else {
                            num2 = double.parse(input.text.replaceAll('%', ''));
                            _operation();
                            operator = '/';
                            if (input.text != "") num1 = double.parse(input.text);
                            input.text = "0"; }
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
                          if (input.text == "0" || input.text == "00" || input.text == " " || input.text == "")
                          {str += "sin⁻¹";
                          function = "asin";
                          }
                          else {
                            num1 = double.parse(input.text);
                            operator = "*";
                            str += "sin⁻¹";
                            function = "asin";
                            input.text = "0";
                          }
                          setState(() {});
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
                        onPressed: () {
                          if (input.text == "0" || input.text == "00" || input.text == " " || input.text == "")
                          {str += "cos⁻¹";
                          function = "acos";
                          }
                          else {
                            num1 = double.parse(input.text);
                            operator = "*";
                            str += "cos⁻¹";
                            function = "acos";
                            input.text = "0";
                          }
                          setState(() {});
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
                        onPressed: () {
                          if (input.text == "0" || input.text == "00" || input.text == " " || input.text == "")
                          {str += "tan⁻¹";
                          function = "atan";
                          }
                          else {
                            num1 = double.parse(input.text);
                            operator = "*";
                            str += "tan⁻¹";
                            function = "atan";
                            input.text = "0";
                          }
                          setState(() {});
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
                                    "√",
                                    style: TextStyle(color: Colors.white, fontSize: 30),
                                  ))),
                        ),
                        onPressed: () {
                          if (input.text == "0" || input.text == "00" || input.text == " " || input.text == "")
                          {str += "√";
                          function = "sqrt";
                          }
                          else {
                            num1 = double.parse(input.text);
                            operator = "*";
                            str += "√";
                            function = "sqrt";
                            input.text = "0";
                          }
                          setState(() {});
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
                          str += '%';
                          setState(() {
                          });
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
                          str += "9";
                          setState(() {});
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
                          str += "8";
                          setState(() {});
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
                          str += "7";
                          setState(() {});
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
                                "log",
                                style: TextStyle(color: Colors.white, fontSize: 30),
                              ))),
                        ),
                        onPressed: () {
                          if (input.text == "0" || input.text == "00" || input.text == " " || input.text == "")
                          {str += "log";
                          function = "log";
                          }
                          else {
                            num1 = double.parse(input.text);
                            operator = "*";
                            str += "log";
                            function = "log";
                            input.text = "0";
                          }
                          setState(() {});
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
                                "X",
                                style: TextStyle(color: Colors.white, fontSize: 30),
                              ))),
                        ),
                        onPressed: () {
                          str += "X";
                          setState(() {});
                          if (function != ""){
                            if (input.text != "") num1 = double.parse(input.text);
                            input.text = _function(num1,function).toString();
                            function = "";
                            setState(() {
                            });
                          }
                          if (operator == ''){
                            operator = '*';
                            if (input.text != "") num1 = double.parse(input.text);
                            input.text = "0";}
                          else {
                            num2 = double.parse(input.text.replaceAll('%', ''));
                            _operation();
                            operator = '*';
                            if (input.text != "") num1 = double.parse(input.text);
                            input.text = "0"; }
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
                          str += "6";
                          setState(() {});
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
                          str += "5";
                          setState(() {});
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
                          str += "4";
                          setState(() {});
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
                                    "e^",
                                    style: TextStyle(color: Colors.white, fontSize: 30),
                                  ))),
                        ),
                        onPressed: () {
                          if (input.text == "0" || input.text == "00" || input.text == " " || input.text == "")
                          {str += "e^";
                          function = "exp";
                          }
                          else {
                            num1 = double.parse(input.text);
                            operator = "*";
                            str += "e^";
                            function = "exp";
                            input.text = "0";
                          }
                          setState(() {});
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
                          str += "-";
                          setState(() {});
                          if (function != ""){
                            if (input.text != "") num1 = double.parse(input.text);
                            input.text = _function(num1,function).toString();
                            function = "";
                            setState(() {
                            });
                          }
                          if (operator == ''){
                            operator = '-';
                            if (input.text != "") num1 = double.parse(input.text);
                            input.text = "0";}
                          else {
                            num2 = double.parse(input.text.replaceAll('%', ''));
                            _operation();
                            operator = '-';
                            if (input.text != "") num1 = double.parse(input.text);
                            input.text = "0"; }
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
                          str += "3";
                          setState(() {});
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
                          str += "2";
                          setState(() {});
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
                          str += "1";
                          setState(() {});
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
                        onPressed: () {
                          if (input.text == "" || input.text == " " || input.text == "0")
                          {input.text = e.toStringAsFixed(4).toString();}
                          else {
                            num1 = double.parse(input.text);
                            operator = "*";
                            input.text = e.toStringAsFixed(4).toString();
                          }
                          str += "e";
                          setState(() {

                          });
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
                                "+",
                                style: TextStyle(color: Colors.white, fontSize: 30),
                              ))),
                        ),
                        onPressed: () {
                          str += "+";
                          setState(() {});
                          if (function != ""){
                            if (input.text != "") num1 = double.parse(input.text);
                            input.text = _function(num1,function).toString();
                            function = "";
                            setState(() {
                            });
                          }
                          if (operator == ''){
                          operator = '+';
                          if (input.text != "")
                          {
                            num1 = double.parse(input.text);
                          }
                          input.text = "0";}
                          else {
                          num2 = double.parse(input.text.replaceAll('%', ''));
                          _operation();
                          operator = '+';
                          if (input.text != "") num1 = double.parse(input.text);
                          input.text = "0"; }
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
                          clear();
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
                            input.text += "0";
                            str += "0";
                            setState(() {});
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
                                    "00",
                                    style: TextStyle(color: Colors.white, fontSize: 30),
                                  ))),
                        ),
                        onPressed: () {
                          str += "00";
                          setState(() {});
                          input.text += "00";
                          setState(() {

                          });
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
                                duration: Toast.LENGTH_LONG,
                                gravity: Toast.BOTTOM);
                          } else {
                            input.text += ".";
                            str += ".";
                            setState(() {
                            });
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
                                "=",
                                style: TextStyle(color: Colors.white, fontSize: 30),
                              ))),
                        ),
                        onPressed: () {
                          str = "";
                          if (function!= ""){
                            num = double.parse(input.text.replaceAll('%', ''));
                            num2 = _function(num,function);
                            input.text = num2.toString();
                            if (operator!= '') {
                              num2 = double.parse(input.text.replaceAll('%', ''));
                              _operation();
                              str = "";
                              setState(() {}); }
                            str = "";
                            setState(() {});
                          }else
                          if (operator!= '') {
                            num2 = double.parse(input.text.replaceAll('%', ''));
                            _operation();
                            str = "";
                            setState(() {}); }
                          setState(() {

                          });

                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
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
