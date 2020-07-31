import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:quartet/quartet.dart';

class normalCalculator extends StatefulWidget {
  _normalCalculatorState createState() => _normalCalculatorState();
}


class _normalCalculatorState extends State<normalCalculator> {
  TextEditingController input = TextEditingController();
  String str = "";
  String operator = '';
  double num1 = 0;
  double num2 = 0;

  backspace(String Input) {
    int n = Input.length;
    String erased = substr(Input,-1,1);
    if (erased == '+' || erased == '-' || erased == 'X' || erased == '/' || erased == '%') {
      String sliced = Input.substring(0, n - 1);
      operator='';
      input.text = num1.toString();
      return sliced;
    }else{
      String sliced = Input.substring(0, n - 1);
      return sliced;
    }
  }
  clear() {
    input.text= "0";
    str = "";
    operator = '';
    num1 = 0; num2 = 0;
    setState(() {});
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
            begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Colors.white, Colors.white, Color(0xffFFDBC6)]
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    str,style: TextStyle(color: Colors.deepOrange, fontSize: 60), textAlign: TextAlign.end,
                  ),
                ),

                Container(
                  height: 70,),

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
                        color: Colors.deepOrangeAccent,
                        fontSize: 30
                    ),
                  ),
                ),
              Expanded(
                child: new Divider(color: Colors.deepOrange,),
              ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      MaterialButton(
                        child: Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              //shape: BoxShape.circle,
                                borderRadius: BorderRadius.all(Radius.circular(100)),
                                gradient: LinearGradient(colors: [Colors.orange,Colors.deepOrange])
                            ),
                            child: Center(child: Text("AC", style: TextStyle(color: Colors.white, fontSize: 30),))),
                        onPressed: () {
                          clear();
                        },
                      ),
                      MaterialButton(
                        child: Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              //shape: BoxShape.circle,
                                borderRadius: BorderRadius.all(Radius.circular(100)),
                                gradient: LinearGradient(colors: [Colors.orange,Colors.deepOrange])
                            ),
                            child: Center(child: Text("%", style: TextStyle(color: Colors.white, fontSize: 30),))),
                        onPressed: () {
                          input.text += "%";
                          operator = '%';
                          str += '%';
                          setState(() {});
                        },
                      ),
                      MaterialButton(
                        child: Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              //shape: BoxShape.circle,
                                borderRadius: BorderRadius.all(Radius.circular(100)),
                                gradient: LinearGradient(colors: [Colors.orange,Colors.deepOrange])
                            ),
                            child: Center(child: Text("/", style: TextStyle(color: Colors.white, fontSize: 30),))),
                        onPressed: () {
                          str+='/';
                          if (operator == ''){
                          operator = '/';
                          if (input.text != '') num1 = double.parse(input.text);
                          input.text = "0";}
                          else {
                            num2 = double.parse(input.text.replaceAll('%', ''));
                            _operation();
                            operator = '/';
                            if (input.text != '') num1 = double.parse(input.text);
                            input.text = "0";
                          }
                          setState(() {});
                        },
                      ),
                      MaterialButton(
                        child: Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              //shape: BoxShape.circle,
                                borderRadius: BorderRadius.all(Radius.circular(100)),
                                gradient: LinearGradient(colors: [Colors.orange,Colors.deepOrange])
                            ),
                            child: Center(child: Icon(Icons.backspace, color: Colors.white,))),
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

                    ],
                  ),
                ),

                Expanded(
                  child: Row(
                    children: <Widget>[
                      MaterialButton(
                        child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            //shape: BoxShape.circle,
                            borderRadius: BorderRadius.all(Radius.circular(100)),
                            gradient: LinearGradient(colors: [Colors.orange,Colors.deepOrange])
                          ),
                            child: Center(child: Text("9", style: TextStyle(color: Colors.white, fontSize: 30),))),
                        onPressed: () {
                          str+="9";
                          if (input.text == "0" || input.text == "00" || input.text == " ")
                          {input.text = "9";}
                          else {
                            input.text += "9";
                          }
                          setState(() {});
                        },
                      ),
                      MaterialButton(
                        child: Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              //shape: BoxShape.circle,
                                borderRadius: BorderRadius.all(Radius.circular(100)),
                                gradient: LinearGradient(colors: [Colors.orange,Colors.deepOrange])
                            ),
                            child: Center(child: Text("8", style: TextStyle(color: Colors.white, fontSize: 30),))),
                        onPressed: () {
                          str +="8";
                          if (input.text == "0" || input.text == "00" || input.text == " ")
                          {input.text = "8";}
                          else {
                            input.text += "8";
                          }
                          setState(() {});
                        },
                      ),
                      MaterialButton(
                        child: Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              //shape: BoxShape.circle,
                                borderRadius: BorderRadius.all(Radius.circular(100)),
                                gradient: LinearGradient(colors: [Colors.orange,Colors.deepOrange])
                            ),
                            child: Center(child: Text("7", style: TextStyle(color: Colors.white, fontSize: 30),))),
                        onPressed: () {
                          if (input.text == "0" || input.text == "00" || input.text == " ")
                          {input.text = "7";}
                          else {
                            input.text += "7";
                          }
                          str +="7";
                          setState(() {});
                        },
                      ),
                      MaterialButton(
                        child: Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              //shape: BoxShape.circle,
                                borderRadius: BorderRadius.all(Radius.circular(100)),
                                gradient: LinearGradient(colors: [Colors.orange,Colors.deepOrange])
                            ),
                            child: Center(child: Text("X", style: TextStyle(color: Colors.white, fontSize: 30),))),
                        onPressed: () {
                          if (operator == ''){
                            operator = '*';
                            if (input.text != '') num1 = double.parse(input.text);
                            input.text = "0";}
                          else {
                            num2 = double.parse(input.text.replaceAll('%', ''));
                            _operation();
                            operator = '*';
                            if (input.text != '') num1 = double.parse(input.text);
                            input.text = "0";
                          }
                          str +="X";
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      MaterialButton(
                        child: Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              //shape: BoxShape.circle,
                                borderRadius: BorderRadius.all(Radius.circular(100)),
                                gradient: LinearGradient(colors: [Colors.orange,Colors.deepOrange])
                            ),
                            child: Center(child: Text("6", style: TextStyle(color: Colors.white, fontSize: 30),))),
                        onPressed: () {
                          if (input.text == "0" || input.text == "00" || input.text == " ")
                          {input.text = "6";}
                          else {
                            input.text += "6";
                          }
                          str +="6";
                          setState(() {});
                        },
                      ),
                      MaterialButton(
                        child: Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              //shape: BoxShape.circle,
                                borderRadius: BorderRadius.all(Radius.circular(100)),
                                gradient: LinearGradient(colors: [Colors.orange,Colors.deepOrange])
                            ),
                            child: Center(child: Text("5", style: TextStyle(color: Colors.white, fontSize: 30),))),
                        onPressed: () {
                          if (input.text == "0" || input.text == "00" || input.text == " ")
                          {input.text = "5";}
                          else {
                            input.text += "5";
                          }
                          str +="5";
                          setState(() {});
                        },
                      ),
                      MaterialButton(
                        child: Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              //shape: BoxShape.circle,
                                borderRadius: BorderRadius.all(Radius.circular(100)),
                                gradient: LinearGradient(colors: [Colors.orange,Colors.deepOrange])
                            ),
                            child: Center(child: Text("4", style: TextStyle(color: Colors.white, fontSize: 30),))),
                        onPressed: () {
                          if (input.text == "0" || input.text == "00" || input.text == " ")
                          {input.text = "4";}
                          else {
                            input.text += "4";
                          }
                          str +="4";
                          setState(() {});
                        },
                      ),
                      MaterialButton(
                        child: Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              //shape: BoxShape.circle,
                                borderRadius: BorderRadius.all(Radius.circular(100)),
                                gradient: LinearGradient(colors: [Colors.orange,Colors.deepOrange])
                            ),
                            child: Center(child: Text("-", style: TextStyle(color: Colors.white, fontSize: 30),))),
                        onPressed: () {
                          if (operator == ''){
                            operator = '-';
                            if (input.text != '') num1 = double.parse(input.text);
                            input.text = "0";}
                          else {
                            num2 = double.parse(input.text.replaceAll('%', ''));
                            _operation();
                            operator = '-';
                            if (input.text != '') num1 = double.parse(input.text);
                            input.text = "0";
                          }
                          str +="-";
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      MaterialButton(
                        child: Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              //shape: BoxShape.circle,
                                borderRadius: BorderRadius.all(Radius.circular(100)),
                                gradient: LinearGradient(colors: [Colors.orange,Colors.deepOrange])
                            ),
                            child: Center(child: Text("3", style: TextStyle(color: Colors.white, fontSize: 30),))),
                        onPressed: () {
                          if (input.text == "0" || input.text == "00" || input.text == " ")
                          {input.text = "3";}
                          else {
                            input.text += "3";
                          }
                          str +="3";
                          setState(() {});
                        },
                      ),
                      MaterialButton(
                        child: Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              //shape: BoxShape.circle,
                                borderRadius: BorderRadius.all(Radius.circular(100)),
                                gradient: LinearGradient(colors: [Colors.orange,Colors.deepOrange])
                            ),
                            child: Center(child: Text("2", style: TextStyle(color: Colors.white, fontSize: 30),))),
                        onPressed: () {
                          if (input.text == "0" || input.text == "00" || input.text == " ")
                          {input.text = "2";}
                          else {
                            input.text += "2";
                          }
                          str +="2";
                          setState(() {});
                        },
                      ),
                      MaterialButton(
                        child: Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              //shape: BoxShape.circle,
                                borderRadius: BorderRadius.all(Radius.circular(100)),
                                gradient: LinearGradient(colors: [Colors.orange,Colors.deepOrange])
                            ),
                            child: Center(child: Text("1", style: TextStyle(color: Colors.white, fontSize: 30),))),
                        onPressed: () {
                          if (input.text == "0" || input.text == "00" || input.text == " ")
                          {input.text = "1";}
                          else {
                            input.text += "1";
                          }str +="1";
                          setState(() {});
                        },
                      ),
                      MaterialButton(
                        child: Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              //shape: BoxShape.circle,
                                borderRadius: BorderRadius.all(Radius.circular(100)),
                                gradient: LinearGradient(colors: [Colors.orange,Colors.deepOrange])
                            ),
                            child: Center(child: Text("+", style: TextStyle(color: Colors.white, fontSize: 30),))),
                        onPressed: () {
                          if (operator == ''){
                            operator = '+';
                            if (input.text != '') num1 = double.parse(input.text);
                            input.text = "0";}
                          else {
                            num2 = double.parse(input.text.replaceAll('%', ''));
                            _operation();
                            operator = '+';
                            if (input.text != '') num1 = double.parse(input.text);
                            input.text = "0";
                          }
                          str +="+";
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      MaterialButton(
                        child: Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              //shape: BoxShape.circle,
                                borderRadius: BorderRadius.all(Radius.circular(100)),
                                gradient: LinearGradient(colors: [Colors.orange,Colors.deepOrange])
                            ),
                            child: Center(child: Text("00", style: TextStyle(color: Colors.white, fontSize: 30),))),
                        onPressed: () {
                          input.text += "00";
                          str +="00";
                          setState(() {});
                        },
                      ),
                      MaterialButton(
                        child: Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              //shape: BoxShape.circle,
                                borderRadius: BorderRadius.all(Radius.circular(100)),
                                gradient: LinearGradient(colors: [Colors.orange,Colors.deepOrange])
                            ),
                            child: Center(child: Text("0", style: TextStyle(color: Colors.white, fontSize: 30),))),
                        onPressed: () {
                          if (input.text == "0" || input.text == "00" || input.text == " ")
                          {input.text = "0";}
                          else {
                            input.text += "0";
                          }
                          str +="0";
                          setState(() {});
                        },
                      ),
                      MaterialButton(
                        child: Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              //shape: BoxShape.circle,
                                borderRadius: BorderRadius.all(Radius.circular(100)),
                                gradient: LinearGradient(colors: [Colors.orange,Colors.deepOrange])
                            ),
                            child: Center(child: Text(".", style: TextStyle(color: Colors.white, fontSize: 30),))),
                        onPressed: () {
                          if  (input.text.contains(".")) {
                            Toast.show("Already Contains a decimal", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                          }
                          else {
                            input.text += ".";
                            str +=".";
                            setState(() {});
                          }

                        },
                      ),
                      MaterialButton(
                        child: Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              //shape: BoxShape.circle,
                                borderRadius: BorderRadius.all(Radius.circular(100)),
                                gradient: LinearGradient(colors: [Colors.orange,Colors.deepOrange])
                            ),
                            child: Center(child: Text("=", style: TextStyle(color: Colors.white, fontSize: 30),))),
                        onPressed: () {
                          if (operator != ''){
                            num2 = double.parse(input.text.replaceAll('%', ''));
                          _operation();
                          str = ""; }
                          setState(() {

                          });
                        },
                      ),
                    ],
                  ),
                ),


              ],
            ),
          ),

      ),
    );
  }
}